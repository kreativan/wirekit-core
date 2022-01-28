<?php
/**
 *  MenuManager
 *
 *  @author Ivan Milincic <kreativan.dev@gmail.com>
 *  @copyright 2021 kraetivan.dev
 *  @link http://kraetivan.dev
*/

class MenuManager extends Process implements WirePageEditor {

  // for WirePageEditor
  public function getPage() {
    return $this->page;
  }

  public function init() {
    parent::init(); // always remember to call the parent init

    // Delete menu cache
    $this->addHookBefore('Pages::saveReady', function(HookEvent $event) {
      $page = $event->arguments(0);
      if($page->template == "menu-item") $page->parent->clearMenuCache();
    });

    //
    //  Create New Menu Item
    //
    if($this->input->post->submit_new_menu_item) {

      $main_menu      = $this->pages->get("/system/main-menu/");
      $parent_menu    = $this->pages->get("/system/{$this->input->post->menu}/");

      $p = new Page();
      $p->template = "menu-item";
      $p->parent = (!$this->input->post->menu) ? $main_menu : $parent_menu;
      $p->title = $this->input->post->title;
      $p->save();

      $this->message($p->title . " has been created.");

      $this->session->redirect($this->page->url."edit/?id={$p->id}&back_url=?menu={$this->input->post->menu}");
    }

  }

  /* ----------------------------------------------------------------
    Admin UI
  ------------------------------------------------------------------- */
  public function ___execute() {

    /**
     *  Redirect helper
     *  this should always redirect us where we left off after page save,
     *  back to paginated page, or with get variables...
     */
    $this->wirekit->redirectHelper();

    // set a new headline, replacing the one used by our page
    // this is optional as PW will auto-generate a headline
    $this->headline('Menu Manager');
    // add a breadcrumb that returns to our main page
    // this is optional as PW will auto-generate breadcrumbs
    $this->breadcrumb('./', 'Menu Manager');
    
    return [
      "this_module" => $this,
      "page_name" => "main",
      "items" => $this->items()
    ];
  }
	
	public function executeEdit() {
    return wire("wirekit")->adminPageEdit();
  }

  public function items() {

    $template 	    = "menu-item";
    $parent_tmpl    = "menu";
    $parent_id      = $this->pages->get("template=$parent_tmpl");

    $main_menu      = $this->pages->get("/system/main-menu/");
    $parent_menu    = $this->pages->get("/system/{$this->input->get->menu}/");

    // selector
    $selector	= "template=$template, include=all";
    $selector	.= ($this->input->get->status) ? ", status={$this->input->get->status}" : ", status!=trash";
    $selector   .= ($this->input->get->menu) ? ", parent=$parent_menu" : ", parent=$main_menu";

    // items
    $items 		= $this->pages->find($selector);

    return $items;

  }

}

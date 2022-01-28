<?php
/**
 *  Tabs
 *  @author Ivan Milincic <kreativan.dev@gmail.com>
 *  @link http://kraetivan.dev
*/

$main_menu      = $this->pages->get("/system/main-menu/");
$parent_menu    = $this->pages->get("/system/{$this->input->get->menu}/");

// TABS
$tabs_arr = [];
foreach($pages->find("template=menu, include=hidden") as $tab) {
  if($tab->name != "main-menu" && !in_array($tab->id, $this_module->hide_menus)) {
    $tabs_arr["$tab->name"] = [
      "title" => $tab->title,
      "url" => $page->url . "./?menu=$tab->name",
    ];
  }
}

?>


<ul class="uk-tab uk-position-relative">

  <?php if(!in_array($main_menu->id, $this_module->hide_menus)):?>
    <li class="<?= (!$this->input->get->menu && $page_name == "main") ? "uk-active" : ""; ?>">
      <a href="<?= $page->url ?>">
        <?= $main_menu->title ?>
      </a>
    </li>
  <?php endif;?>

  <?php foreach($tabs_arr as $key => $value) :?>
    <li class="<?= ($this->input->get->menu == $key) ? "uk-active" : ""; ?>">
      <a href="<?= $value["url"]?>">
        <?= $value["title"] ?>
      </a>
    </li>
  <?php endforeach;?>

  <?php if($page_name != "trash") :?>
    <li>
      <a href="#new-modal" uk-toggle title="Create new menu item" uk-tooltip>
        <i class="fa fa-plus-circle"></i>
        Add New
      </a>
    </li>
  <?php endif; ?>  

  <?php if($this->user->isSuperuser()) :?>
    <li>
      <a href="<?= $modules->getModuleEditUrl($this_module) ?>" title="Module Settings" uk-tooltip>
        <i class="fa fa-cog"></i>
      </a>
    </li>
  <?php endif;?>

</ul>

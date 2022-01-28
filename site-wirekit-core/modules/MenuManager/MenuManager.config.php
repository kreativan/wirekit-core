<?php
/**
 *  MenuManager Config
 *
 *  @author Ivan Milincic <kreativan.dev@gmail.com>
 *  @copyright 2021 kraetivan.dev
 *  @link http://kraetivan.dev
 *  @license http://www.gnu.org/licenses/gpl.html
*/
class MenuManagerConfig extends ModuleConfig {

	public function getInputfields() {
    $inputfields = parent::getInputfields();

    $menusArr = [];
		foreach($this->pages->find("template=menu, include=hidden") as $m) {
			$menusArr["$m"] = $m->title;
		}

    // remove main-menu from array
		$main_menu = $this->pages->get('/system/main-menu/')->id;
		$menusArrNoMain = $menusArr;
		unset($menusArrNoMain[$main_menu]);

		$wrapper = new InputfieldWrapper();


    /* ----------------------------------------------------------------
    	About
    ------------------------------------------------------------------- */
		$about = $this->wire('modules')->get("InputfieldFieldset");
		$about->label = __("About");
		$about->icon = "fa-info";
		$wrapper->add($about);

		$f = $this->wire('modules')->get("InputfieldMarkup");
		$f->attr('name', 'about_this_module');
		//$f->label = 'About This Module';
		$f->value = "Menu manager detects all pages with the <b>menu</b> template, and creates a tab in custom UI for each one. To create new menus, use <b>menu</b> template under <b>Site Settings</b> (page tree).";
		$about->add($f);

		$inputfields->add($about);

		/* ----------------------------------------------------------------
			Menus
		------------------------------------------------------------------- */
		$menu_options = $this->wire('modules')->get("InputfieldFieldset");
		$menu_options->label = __("Menus");
		//$options->collapsed = 1;
		$menu_options->icon = "fa-cog";
		$wrapper->add($menu_options);

    // show_home
    $f = $this->wire('modules')->get("InputfieldRadios");
    $f->attr('name', 'show_home');
		$f->label = 'Show "Home" on main menu';
    $f->options = array(
      '1' => $this->_('Yes'),
      '2' => $this->_('No'),
    );
    $f->required = true;
    $f->defaultValue = "1";
    $f->optionColumns = 1;
    $f->columnWidth = "50%";
    $menu_options->add($f);

    // is_htmx
    $f = $this->wire('modules')->get("InputfieldRadios");
    $f->attr('name', 'home_htmx');
		$f->label = 'Home HTMX';
    $f->options = array(
      '1' => $this->_('Yes'),
      '2' => $this->_('No'),
    );
    $f->required = true;
    $f->defaultValue = "2";
    $f->optionColumns = 1;
    $f->columnWidth = "50%";
    $menu_options->add($f);

    // main_menu_source
		$f = $this->wire('modules')->get("InputfieldSelect");
		$f->attr('name', 'main_menu_source');
		$f->label = 'Main Menu Source';
		$f->options = $menusArr;
		$f->required = true;
		$f->defaultValue = 1;
		$f->optionColumns = 1;
		$f->columnWidth = "50%";
		$f->collapsed = 0;
		$menu_options->add($f);

		// mobile_menu_source
		$f = $this->wire('modules')->get("InputfieldSelect");
		$f->attr('name', 'mobile_menu_source');
		$f->label = 'Mobile Menu Source';
		$f->options = $menusArr;
		$f->required = true;
		$f->defaultValue = 1;
		$f->optionColumns = 1;
		$f->columnWidth = "50%";
		$f->collapsed = 0;
		$menu_options->add($f);

		// hide_menus
		$f = $this->wire('modules')->get("InputfieldAsmSelect");
		$f->attr('name', 'hide_menus');
		$f->label = 'Hide menus from menu-manager';
		$f->options = $menusArrNoMain;
		$menu_options->add($f);

		// render fieldset
    $inputfields->add($menu_options);

		// render fields
		return $inputfields;


	}

}

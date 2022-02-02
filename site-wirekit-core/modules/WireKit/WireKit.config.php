<?php
/**
 *  WireKit Config
 *  @author Ivan Milincic <kreativan.dev@gmail.com>
 *  @link http://www.kraetivan.dev
*/

class WireKitConfig extends ModuleConfig {

	public function getInputfields() {
		$inputfields = parent::getInputfields();

		// create templates options array
		$templatesArr = array();
		foreach($this->templates as $tmp) {
			$templatesArr["$tmp"] = $tmp->name;
		}

		$wrapper = new InputfieldWrapper();

    //  Options
    // ===========================================================

    $options_set = $this->wire('modules')->get("InputfieldFieldset");
		$options_set->label = "Options";
		$wrapper->add($options_set);

      // hide_system_pages
      $f = $this->wire('modules')->get("InputfieldRadios");
      $f->attr('name', 'hide_system_pages');
      $f->label = 'Hide system pages from page tree';
      $f->options = array(
        '1' => "Yes",
        '2' => "No"
      );
      $f->required = true;
      $f->defaultValue = "2";
      $f->optionColumns = 1;
      $f->columnWidth = "50%";
      $options_set->add($f);

      // hide for
      $f = $this->wire('modules')->get("InputfieldRadios");
      $f->attr('name', 'hide_for');
      $f->label = 'Hide pages for';
      $f->options = array(
        '1' => "All",
        '2' => "Non-Superusers"
      );
      $f->required = true;
      $f->defaultValue = "2";
      $f->optionColumns = 1;
      $f->columnWidth = "50%";
      $options_set->add($f);
      

      // sys_pages
      $f = $this->wire('modules')->get("InputfieldAsmSelect");
      $f->attr('name', 'sys_pages');
      $f->label = 'System Pages';
      $f->description = __("Additional pages that will be hidden from page tree");
      $f->options = $templatesArr;
      $options_set->add($f);

    $inputfields->add($options_set);

    //  Compilers
    // ===========================================================
    $compiler_set = $this->wire('modules')->get("InputfieldFieldset");
		$compiler_set->label = "Compiler";
		$wrapper->add($compiler_set);

      $f = $this->wire('modules')->get("InputfieldRadios");
      $f->attr('name', 'compiler');
      $f->label = 'Enable Less/SCSS Compiler';
      $f->options = array('1' => "Yes",'2' => "No");
      $f->required = true;
      $f->defaultValue = "1";
      $f->optionColumns = 1;
      $f->columnWidth = "100%";
      $f->description = "If enabled, will automatically detect changes and compile.";
      $compiler_set->add($f);
      
      $f = $this->wire('modules')->get("InputfieldText");
      $f->attr('name', 'last_compile_time');
      $f->label = 'Last Compile Time';
      $f->columnWidth = "100%";
      $f->collapsed = "8";
      $compiler_set->add($f);

      $html = '
        <code>$wirekit = $modules->get("WireKit");</code><br /> 
        <code>'.htmlspecialchars('<link rel="stylesheet" type="text/css" href="<?= $wirekit->less($less_files_array, $less_vars, "main-css"); ?>">').'</code>
        <br />
        <code>'.htmlspecialchars('<link rel="stylesheet" type="text/css" href="<?= $wirekit->scss(); ?>">').'</code>
      ';
      $f = $this->wire('modules')->get("InputfieldMarkup");
      $f->attr('name', 'less_markup');
      $f->label = 'How to use';
      $f->value = $html;
      $f->columnWidth = "80%";
      $f->collapsed = "8";
      $compiler_set->add($f);

    $inputfields->add($compiler_set);

		// render fields
		return $inputfields;


	}

}

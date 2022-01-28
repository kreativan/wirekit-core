<?php
/**
 *  FieldtypeJsonOptions
 *
 *  @author Ivan Milincic <kreativan.dev@gmail.com>
 *  @copyright 2021 kraetivan.dev
 *  @link http://www.kraetivan.dev
 *
*/
class FieldtypeJsonOptions extends Fieldtype {

	public static $defaultOptionValues = array();

	public static function getModuleInfo() {
		return array(
		'title' => 'JSON Options',
		'version' => 100,
		'summary' => 'Select and radio options from a json file'
		);
	}

	public function ___getConfigInputfields(Field $field) {

		$inputfields = $this->wire(new InputfieldWrapper());

		$f = $this->wire('modules')->get("InputfieldText");
		$f->attr('name', 'json_file');
		$f->label = 'Json File Name';
		$f->value = $field->json_file;
		$f->placeholder = "Folder path...";
		$f->required = true;
		$f->columnWidth = "100%";
		$f->description = "eg: `my-file.json`. File needs to be located in `/vendor/json/` or `/assets/json/` folder.";
		$inputfields->add($f);

		$f = $this->wire('modules')->get("InputfieldRadios");
		$f->attr('name', 'input_type');
		$f->label = 'Inputfield';
		$f->options = [
			'InputfieldSelect' => "Select",
			'InputfieldRadios' => "Radios",
		];
		$f->value = $field->input_type;
		$f->optionColumns = "1";
		$f->required = true;
		$f->defaultValue = "InputfieldSelect";
		$f->columnWidth = "100%";
		$inputfields->add($f);

		return $inputfields;

	}

	public function getInputfield(Page $page, Field $fields) {

		$file_vendor = $this->config->paths->templates . "vendor/json/$fields->json_file";
    $file_root = $this->config->paths->templates . "assets/json/$fields->json_file";
    $json_file = file_exists($file_root) ? $file_root : $file_vendor;

		if(empty($fields->json_file) || !file_exists($json_file)) return;

		$json_data = file_get_contents($json_file);
		$array = json_decode($json_data, true);


		$inputfield = $this->modules->get("{$fields->input_type}");
		if($fields->input_type == "InputfieldRadios") $inputfield->optionColumns = "1";

		foreach($array as $value => $label) {
			$inputfield->addOption($value, $label);
		}

		return $inputfield;

	}

	public function getDatabaseSchema(Field $field) {
		$schema = parent::getDatabaseSchema($field);
		$schema['data'] = 'text NOT NULL';
		$schema['keys']['data_exact'] = 'KEY `data_exact` (`data`(255))';
		$schema['keys']['data'] = 'FULLTEXT KEY `data` (`data`)';
		return $schema;
	}

	public function sanitizeValue(Page $page, Field $field, $value) {
		return $value;
	}

}

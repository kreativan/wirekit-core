<?php namespace ProcessWire;
/**
 *  FieldtypeJsonData
 *  @author Ivan Milincic <kreativan.dev@gmail.com>
 *  @link http://kraetivan.dev
*/

class FieldtypeJsonData extends FieldtypeTextarea {

  public static function getModuleInfo() {
    return [
      'title' => 'JsonData',
      'version' => '0.0.1',
      'summary' => 'Group of fields defined in json folder.',
      'installs' => ['InputfieldJsonData'],
    ];
  }

  /**
   * Return the associated Inputfield
   * @param Page $page
   * @param Field $field
   * @return Inputfield
   */
  public function getInputfield(Page $page, Field $field) {
    $inputField = $this->wire('modules')->get('InputfieldJsonData');
    return $inputField;
  }

  public function ___formatValue(Page $page, Field $field, $value) {
    return json_decode($value);
  }

  public function getDatabaseSchema(Field $field) {
	  $schema = parent::getDatabaseSchema($field);
    $schema['data'] = 'TEXT NOT NULL';
    $schema['keys']['data'] = 'FULLTEXT KEY `data` (`data`)';
    return $schema;
	}

}

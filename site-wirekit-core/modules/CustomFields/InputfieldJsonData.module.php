<?php namespace ProcessWire;
/**
 *  InputfieldJsonData
 *  @author Ivan Milincic <kreativan.dev@gmail.com>
 *  @link http://kraetivan.dev
*/

class InputfieldJsonData extends InputfieldTextarea {

  public static function getModuleInfo() {
    return [
      'title' => 'JsonData', // Module Title
      'summary' => 'Group of fields defined in json folder.', // Module Summary
      'version' => '0.0.1',
      'requires' => ['FieldtypeJsonData'],
    ];
  }

  public function __construct() {
    parent::__construct();
    $page = $this->pages->get($this->input->get->id);
    $template = $page->template;

    $file_lib = $this->config->paths->templates . "vendor/json/$page->template.json";
    $file_ass = $this->config->paths->templates . "assets/json/$page->template.json";
    
    $jsonFile = file_exists($file_ass) ? $file_ass : $file_lib;
    
    if(file_exists($jsonFile)) {
      $jsonData = file_get_contents($jsonFile);
      $json = json_decode($jsonData);
      $this->json = $json;
    }
	}

  /**
   *  Render Inputfield
   *  @return string|markup
   */
  public function ___render() {
    //if(!$this->json) return;

    $name = $this->attr('name');
    $value = $this->attr('value');
    $this_json = json_decode($value);

    $out = "<textarea name='{$name}_json' class='uk-hidden'>$value</textarea>";

    $out .= "<div class='uk-grid uk-grid-small uk-grid-match' uk-grid>";
      foreach($this->json as $f) {

        $grid_size = isset($f->grid_size) && !empty($f->grid_size) && $f->grid_size != "" ? $f->grid_size : "1-1";

        $out .= "<div class='uk-width-{$grid_size}'>";

          if($f->type == "heading") {

            $icon = isset($f->icon) && !empty($f->icon) && $f->icon != "" ? $f->icon : "";
            $style = isset($f->style) && !empty($f->style) && $f->style != "" ? $f->style : "";
            $out .= "<div>".$this->heading($f->text, $icon, $style)."</div>";

          } else {

            $this_value = !empty($this_json->{$f->name}) ? $this_json->{$f->name} : "";
            $this_value = $this_value == "" && !empty($f->default) ? $f->default : "";

            $desc = isset($f->desc) ? $f->desc : "";
            $required = isset($f->required) ? $f->required : "";

            $out .= "<div class='uk-padding-small uk-background-muted'>";
            $out .= $this->label($f->label, $desc, $required);

            if($f->type == "text") {
              $out .= $this->text($f, $this_json);
            } elseif($f->type == "textarea") {
              $out .= $this->textarea($f, $this_json);
            } elseif($f->type == "radio") {
              $out .= $this->radio($f, $this_json);
            } elseif($f->type == "select") {
              $out .= $this->select($f, $this_json);
            }
            
            $out .= "</div>";

          }
      
        $out .= "</div>";
        
      }
    
    $out  .="</div>";

    return $out;

  }

  public function ___processInput(WireInputData $input) {
    $name = $this->attr('name');
    $arr = [];
    foreach($this->json as $f) {
      if($f->type != "heading") {
        $field_name = "{$name}_{$f->name}";
        $field_value = !empty($input[$f->name]) && $input[$f->name] != "" ? $input[$f->name] : $f->default;
        $arr[$f->name] = $field_value;
      }
    }
    if($this->languages && count($this->languages) > 0) {
      foreach($this->languages as $lng) {
        foreach($this->json as $f) {
          if($f->type != "heading") {
            if(isset($f->multilang) && $f->multilang && $lng->name != "default") {
              $field_name = "{$name}_{$f->name}__{$lng->id}";
              $lng_f_name = "{$f->name}__{$lng->id}";
              $field_value = !empty($input[$lng_f_name]) && $input[$lng_f_name] != "" ? $input[$lng_f_name] : "";
              $arr[$lng_f_name] = $field_value;
            }
          }
        }
      }
    }
    $json = json_encode($arr);
    $this->attr('value', $json);
    $this->trackChange('value');
  }


  //--------------------------------------------------------
  //  Fields
  //--------------------------------------------------------
  private function label($label, $desc = "", $req = false) {
    $out = "<label class='uk-display-block uk-margin-small-bottom'>";
    $out .= "<b>$label</b>";
    $out .= $req ? "<span class='uk-text-danger'>*</span>" : "";
    $out .= $desc != "" ? "<span class='uk-display-block uk-form-label uk-text-emphasis uk-text-small'>$desc</span>" : "";
    $out .= "</label>";
    return $out;
  }

  private function heading($text, $icon = "", $style = "") {
    $out = "<label class='InputfieldHeader uk-form-label uk-margin-remove' style='padding:0;$style'>";
    $out .= $icon != "" ? "<i class='fa $icon uk-margin-small-right'></i>" : "";
    $out .= $text;
    $out .= "</label>";
    return $out;
  }

  private function text($field, $this_json) {
    $f = $this->wire('modules')->get("InputfieldText");
    $f->attr('name', $field->name);
    $f->attr('style', 'background-color: white');
    if (isset($field->required) && $field->required) $f->attr('required', "required");
    $f->label = $field->label;
    $f->value = !empty($this_json->{$field->name}) ? $this_json->{$field->name} : "";
    $f->useLanguages = (isset($field->multilang) && $field->multilang && $this->languages && count($this->languages)) > 0 ? true : false;
    if(isset($field->multilang) && $field->multilang && $this->languages && count($this->languages) > 0) {
      foreach($this->languages as $lng) {
        if($lng->name != "default") {
          $valueLng = "value{$lng->id}";
          $field_name_lng = "{$field->name}__{$lng->id}";
          $f->{$valueLng} = $this_json->{$field_name_lng};
        }
      }
    }
    return $f->render();
  }

  private function textarea($field, $this_json) {
    $f = $this->wire('modules')->get("InputfieldTextarea");
    $f->attr('name', $field->name);
    $f->attr('style', 'background-color: white');
    if (isset($field->required) && $field->required) $f->attr('required', "required");
    $f->label = $field->label;
    $f->value = !empty($this_json->{$field->name}) ? $this_json->{$field->name} : "";
    $f->rows = isset($field->rows) && !empty($field->rows) ? $field->rows : "5";
    $f->useLanguages = (isset($field->multilang) && $field->multilang && $this->languages && count($this->languages)) > 0 ? true : false;
    if(isset($field->multilang) && $field->multilang && $this->languages && count($this->languages) > 0) {
      foreach($this->languages as $lng) {
        if($lng->name != "default") {
          $valueLng = "value{$lng->id}";
          $field_name_lng = "{$field->name}__{$lng->id}";
          $f->{$valueLng} = $this_json->{$field_name_lng};
        }
      }
    }
    return $f->render();
  }

  private function radio($field, $this_json) {
    $required = isset($feild->required) && $field->required ? "required" : "";
    $value = $this_json->{$field->name};
    $out = "";
    foreach($field->options as $item) {
      $selected = $item->value == $value ? "checked" : "";
      $out .=
      "<label class='uk-margin-small-right'>
        <input type='radio' class='uk-radio' name='{$field->name}' value='$item->value' $required $selected />
        <span>{$item->label}</span>
      </label>
      ";
    }
    return $out;
  }

  private function select($field, $this_json) {
    $required = isset($feild->required) && $field->required ? "required" : "";
    $value = $this_json->{$field->name};
    $out = "";
    $out .= "<select class='uk-select' name='{$field->name}' $required style='background-color: white; width:100%'>";
    foreach($field->options as $item) {
      $selected = $item->value == $value ? "selected" : "";
      $out .= "<option value='{$item->value}' $selected>{$item->label}</option>";
    }
    $out .= "</select>";
    return $out;
  }

}

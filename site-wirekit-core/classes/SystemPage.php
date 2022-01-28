<?php namespace ProcessWire;
/**
 *  System Page
 * 
 *  -- Images --
 *  Get image
 *  @example $system->image("picture.jpg")
 *  Get image by name
 *  @example $system->media->get("name=picture.jpg")
 *  Get image by sort number
 *  @example $system->media->eq(0)
 *  Get image by Tag
 *  @example $system->media->getTag("mytag")
 * 
 *  -- Favicon --
 *  @example $system->favicon("size")
 * 
 *  -- Settings --
 *  @example $system->settings("site_name")
 *  @example $system->updateSettings(["site_name" => "MY Name"])
 */

class SystemPage extends Page {

  /**
   *  Get image from media
   *  @param string $image name
   *  @return object|image
   */
  public function image($name) {
    return $this->media->get("name=$name");
  }

  /**
   *  Favicon
   *  @param string $size
   *  @return bool|string false or favicon url
   */
  function favicon($size = "16") {
    $favicon = $this->favicon;
    if(!$favicon || empty($favicon) || $favicon == "") return false;
    return $favicon->size($size, $size)->url;
  }

  /**
   *  Get System Settings
   *  @param string $f - $static field name
   *  @example $system->static->site_name == $sustem->settings("site_name");
   *  @return string|array
   */
  public function settings($f = "") {
    if (!$this->static || empty($this->static) || $this->static == "") return false; 
    if ($f == "") return $this->static;
    $user_lang = wire("user")->language;
    if($user_lang && $user_lang->name != "default") {
      $field_name = "{$f}__{$user_lang->id}";
      $value = isset($this->static->{$field_name}) ? $this->static->{$field_name} : "";
      $value = !empty($value) ? $value : $this->static->{$f};
      return $value;
    } else {
      return $this->static->{$f};
    }
  }

  /**
   *  Update Settings
   *  @param array $options ["field_name" => "value"]
   */
  public function updateSettings($options = []) {
    $static = $this->static;
    foreach($options as $key => $value) {
      if(isset($static->{$key})) $static->{$key} = $value;
    }
    $this->of(false);
    $this->static = json_encode($static); // encode to json
    $this->save();
  }

}
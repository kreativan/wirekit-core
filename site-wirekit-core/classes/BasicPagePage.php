<?php namespace ProcessWire;

class BasicPagePage extends Page {

  public function ___loaded() {
    // will run when page is called / loaded anywhere
  }

  public function init() {
    // will run every time page is accessed on front-end
  }

  /**
   * Page JSON
   * Return custom json data at /this-page-url/json/
   * Need to return false, json or array
   * @return bool|array|json|
   */
  public function json() {
    $arr = [
      "id" => $this->id,
      "url" => $this->url,
      "title" => $this->title,
    ];
    return json_encode($arr);
  }

}
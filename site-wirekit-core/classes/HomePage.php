<?php namespace ProcessWire;
/**
 *  Extend HomePage class
 *
 *  @var $this - use $this inside the class to get Page object
 *
 *  use $this->wire() to access pw api method
 *  @example $this->wire('sanitizer')
 *
 *  All methods on front-end can be used as:
 *  @example $page->myMethod()
 *
*/

class HomePage extends Page {

  public function heroText() {

    $headline = str_replace('{', '<em class="wk-text-up wk-text-bold">', $this->headline);
    $headline = str_replace('}', "</em>", $headline);

    $out = "<div class='hero-text wk-margin-bottom-m wk-text-center'>";
    $out .= "<h1>$headline</h1>";
    $out .= "<h3 class='wk-text-up'>{$this->summary}</h3>";
    $out .= "</div>";

    return $out;

  }
  


}

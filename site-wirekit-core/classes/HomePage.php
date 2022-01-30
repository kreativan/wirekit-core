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
    return "WIREKIT Core";
  }

}

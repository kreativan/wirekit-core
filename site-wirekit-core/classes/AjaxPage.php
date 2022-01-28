<?php namespace ProcessWire;

class AjaxPage extends Page {

  public function jsonResponse($response = []) {
    header('Content-type: application/json');
    if (count($response) > 0) echo json_encode($response);
    exit();
  }

}
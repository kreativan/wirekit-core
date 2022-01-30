<?php namespace ProcessWire;

if($input->get->something) {

  // do your logic here

}

$response = [
  "status" => "success",
  "notification" => "Ajax request was ok!",
  "GET" => $_GET,
];

// JSON Reponse
$ajax->jsonResponse($response);
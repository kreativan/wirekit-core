<?php namespace ProcessWire;

if($input->get->something) {

  // do your logic here

}

$response = [
  "status" => "success",
  "get" => $_GET,
];

header('Content-type: application/json');
echo json_encode($response);

exit();
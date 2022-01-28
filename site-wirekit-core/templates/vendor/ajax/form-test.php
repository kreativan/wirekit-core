<?php namespace ProcessWire;

if($input->post->something) {

  // do your logic here

}

$response = [
  "status" => "success",
  "reset_form" => false, // clear-reset form input values
  "notification" => "Notification: Ajax form submit was ok!", // if no modal, notification will be used
  "modal" => "<h3>Modal Response</h3><p>Ajax form submit was successful</p>", // modal has priority
  "redirect" => "/", // if used with modal, will redirect after modal confirm... 
  "post" => $_POST,
];

header('Content-type: application/json');
echo json_encode($response);

exit();
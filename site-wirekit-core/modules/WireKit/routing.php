<?php
// Get page json
// on /my-page/json/
$this->addHook('(/.*)/json/?', function($event) {
  $page = $event->pages->get($event->arguments(1));
  if ($page->viewable()) {
    if(method_exists($page, "json")) {
      $json = $page->json();
      if($json === false) return false;
      header('Content-type: application/json');
      return is_array($json) ? json_encode($json) : $json;
    }
  }
}); 

// Dev Page
if($this->user->isSuperuser()) {
  $this->addHook('/dev/', function($event) {
    $this->files->include($this->config->paths->templates . "_init.php");
    $this->files->include($this->config->paths->templates . "_dev.php");
    return true;
  });
}

// Wirekit Route
// include file based on file_name argument
$this->addHook('/wirekit/{file_name}/?', function($event) {
  $this->files->include($this->config->paths->templates . "_init.php");
  $file_name = $event->arguments(1);
  $file = __DIR__ . "/features/{$file_name}.php";
  if(!file_exists($file)) return false; // throw 404
  $this->files->include($file);
  return true;
});
<?php
//
//  On Page Save
//
$this->addHookBefore('Pages::saveReady', function(HookEvent $event) {

  $page = $event->arguments(0);

  $languages = wire("languages");

  // Make sure page is active for all languages
  if($languages && count($languages) > 0) {
    foreach($languages as $lng)  {
      if($lng->name != "default") {
        $status = "status{$lng->id}";
        $page->{$status} = 1;
      }
    }
  }

  // Make sure page has default title set
  // use first avalable title from other languages
  if($languages && count($languages) > 0) {
    $default_title = $page->getLanguageValue("default", "title");
    if(empty($default_title)) {
      foreach($languages as $lng)  {
        $this_title = $page->getLanguageValue($lng, "title");
        if(!empty($this_title)) {
          $page->title = $this_title;
          break;
        }
      }
    }
  }

});

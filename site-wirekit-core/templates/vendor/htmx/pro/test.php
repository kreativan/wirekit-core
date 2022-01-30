<?php namespace ProcessWire;
if(isset($note)) d($note);
if(isset($page_url) || isset($page_id)) d($page);

// Data for HTMX Req
$htmx_test_data = [
  "get" => "vendor/htmx/pro/test-2/",
  "trigger" => "revealed",
  "target" => "#test-2-container",
  "swap" => "innerHTML",
  "vals" => [
    "cms" => "ProcessWire",
    "framework" => "WireKit",
    "starter" => "Pro",
  ],
];

?>

<div class="uk-container tm-container-margin" uk-height-viewport="expand: true">

  <h1>HTMX Test</h1>
  <div id="test-2-container" <?= $htmx->req($htmx_test_data) ?>></div>

  <div id="lazy-count"
    hx-get="<?= $htmx->url ?>vendor/htmx/pro/lazy-count/"
    hx-trigger="load delay:1s"
    hx-vars='{"s": "4"}'
  >
    Content below will be lazy loaded with a <b class="uk-animation-fade">5s</b> delay...
  </div>

  <a id="skip-lazy-count" href="#" 
    class="uk-button uk-button-danger uk-button-small uk-margin-top"
    hx-get="<?= $htmx->url ?>vendor/htmx/pro/lazy-content/"
    hx-target="#lazy-count"
    hx-trigger="click delay:0.5s"
    hx-vars='{"title": "Skipped Loading!!!"}'>
    Skip Timer
  </a>

</div>
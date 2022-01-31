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

<div class="w-container w-margin-l">

  <h1>HTMX Test</h1>
  <div id="test-2-container" <?= $htmx->req($htmx_test_data) ?>></div>

  <p id="lazy-count"
    hx-get="<?= $htmx->url ?>vendor/htmx/core/lazy-count/"
    hx-trigger="load delay:1s"
    hx-vars='{"s": "4"}'
  >
    Content below will be lazy loaded with a <b class="w-anim-fade">5s</b> delay...
  </p>

  <a id="skip-lazy-count" href="#" 
    hx-get="<?= $htmx->url ?>vendor/htmx/core/lazy/"
    hx-target="#lazy-count"
    hx-trigger="click delay:0.5s"
    hx-vars='{"title": "Skipped Loading!!!"}'>
    Skip Timer
  </a>


</div>
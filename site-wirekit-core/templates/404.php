<?php namespace ProcessWire; 
head([
  "meta_title" => "404 - Page Not Found"
]); 
?>

<div class="wk-container wk-margin-l">
  <div id="message-404">
    <?= $page->body ?>
  </div>
</div>

<?php foot(); ?>

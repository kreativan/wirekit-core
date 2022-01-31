<?php namespace ProcessWire; 
head([
  "meta_title" => "404 - Page Not Found"
]); 
?>

<div class="w-container w-margin-l">
  <div id="message-404">
    <?= $page->body ?>
  </div>
</div>

<?php foot(); ?>

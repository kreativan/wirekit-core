<?php namespace ProcessWire; 
head(); 
?>

<div class="wk-container wk-margin-l">

  <h1><?= $page("headline|title") ?></h1>

  <?php 
    render("layout/common/breadcrumbs.php", [
      "page" => $page,
    ]); 
  ?>

  <?= $page->body ?>

</div>

<?php foot(); ?>
<?php namespace ProcessWire; 
head(); 
?>

<div class="w-container w-margin-l">

  <h1><?= $page("headline|title") ?></h1>

  <?php 
    render("layout/common/breadcrumbs.php", [
      "page" => $page,
    ]); 
  ?>

  <?= $page->body ?>

</div>

<?php foot(); ?>
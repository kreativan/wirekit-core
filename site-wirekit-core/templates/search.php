<?php namespace ProcessWire; 
head(); 
$i = 0;
?>

<div class="w-container w-container-s w-margin-l">

  <h1 class="w-h2 w-text-center">
    <?= $page->headline() ?>
  </h1>

  <div class="w-margin w-padding w-bg-muted">
    <form action="./" method="GET">
      <div class="w-flex w-flex-wrap">
        <div class="w-width-80 w-width-100--sm">
          <input 
            class="w-input w-bg-white" 
            type="text" 
            name="q" 
            placeholder="<?= __("Enter a search term...") ?>"
            value="<?= $input->get->q ?>" 
          />
        </div>
        <div class="w-width-20 w-width-100--sm">
          <input 
            class="w-btn w-btn-primary w-width-100" 
            type="submit" 
            name="submit" 
            value="<?= __("Search") ?>" 
          />
        </div>
      </div>
    </form>
  </div>

  <?php if($page->results()) : ?>
  <p>
    <?= $page->results()->count ?>
    <?= __("Search results for") ?>: <b><?= $input->get->q ?></b>
  </p>
  <hr />
  <?php endif;?>

  <?php if($page->results() && $page->results()->count) :?>
  <div id="search-results">
    <?php foreach($page->results() as $item) :?>

    <?= ($i++ > 0) ? "<hr />" : "" ?>

    <div>

      <h3 class="w-margin-remove">
        <a class="w-link" href="<?= $item->url ?>">
          <?= $item->title ?>
        </a>
      </h3>

      <p class="w-text-muted w-margin-remove">
        <?= $page->markWord($input->get->q, $item->url); ?>
      </p>

      <p class="w-margin-s">
        <?php
          $text = !empty($item->text) ? $item->text : $item->body;
          $text = $sanitizer->truncate($text, 240);
          echo $page->markWord($input->get->q, $text);
        ?>
      </p>

    </div>
    <?php endforeach;?>
  </div>

  <?php
    render("layout/common/pagination.php", [
      "items" => $page->results(),
      "class" => "w-flex-center w-margin-medium-top",
    ]);
  ?>

  <?php else :?>

  <p class="w-h4 w-text-muted w-margin-m w-text-center">
    <?= __("No search results") ?>
  </p>

  <?php endif; ?>

</div>
<?php foot(); ?>
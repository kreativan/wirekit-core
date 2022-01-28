<?php namespace ProcessWire; 
head(); 
$i = 0;
?>

<div class="wk-container wk-container-s wk-margin-l">

  <h1 class="wk-h2 wk-text-center">
    <?= $page->headline() ?>
  </h1>

  <div class="wk-margin wk-padding wk-bg-muted">
    <form action="./" method="GET">
      <div class="wk-flex wk-flex-wrap">
        <div class="wk-width-80 wk-width-100--sm">
          <input 
            class="wk-input wk-bg-white" 
            type="text" 
            name="q" 
            placeholder="<?= __("Enter a search term...") ?>"
            value="<?= $input->get->q ?>" 
          />
        </div>
        <div class="wk-width-20 wk-width-100--sm">
          <input 
            class="wk-btn wk-btn-primary wk-width-100" 
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

      <h3 class="wk-margin-remove">
        <a class="wk-link" href="<?= $item->url ?>">
          <?= $item->title ?>
        </a>
      </h3>

      <p class="wk-text-muted wk-margin-remove">
        <?= $page->markWord($input->get->q, $item->url); ?>
      </p>

      <p class="wk-margin-s">
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
      "class" => "wk-flex-center wk-margin-medium-top",
    ]);
  ?>

  <?php else :?>

  <p class="wk-h4 wk-text-muted wk-margin-m wk-text-center">
    <?= __("No search results") ?>
  </p>

  <?php endif; ?>

</div>
<?php foot(); ?>
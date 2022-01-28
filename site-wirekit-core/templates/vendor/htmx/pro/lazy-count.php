<?php namespace ProcessWire; ?>

<?php if($input->get->s == "4") :?>
  <div id="lazy-count"
    hx-get="<?= $htmx->url ?>vendor/htmx/pro/lazy-count/"
    hx-trigger="load delay:1s"
    hx-vars='{"s": "3"}'
  >
    Content below will be lazy loaded with a <b class="uk-animation-fade">4s</b> delay...
  </div>
<?php elseif($input->get->s == "3") :?>
  <div id="lazy-count"
    hx-get="<?= $htmx->url ?>vendor/htmx/pro/lazy-count/"
    hx-trigger="load delay:1s"
    hx-vars='{"s": "2"}'
  >
    Content below will be lazy loaded with a <b class="uk-animation-fade">3s</b> delay...
  </div>
<?php elseif($input->get->s == "2") :?>
  <div id="lazy-count"
    hx-get="<?= $htmx->url ?>vendor/htmx/pro/lazy-count/"
    hx-trigger="load delay:1s"
    hx-vars='{"s": "1"}'
  >
    Hold on... Only <b class="uk-animation-fade">2</b> seconds more...
  </div>
<?php elseif($input->get->s == "1") :?>
  <div id="lazy-count"
    hx-get="<?= $htmx->url ?>vendor/htmx/pro/lazy-count/"
    hx-trigger="load delay:1s"
    hx-vars='{"s": "0", "title": "Wirekit HTMX Integration"}'
  >
    Hold on... Only <b class="uk-animation-fade">1</b> more second...
  </div>
<?php elseif($input->get->s == "0") : ?>
  <?php render("vendor/htmx/pro/lazy-content.php"); ?>
<?php endif;?>
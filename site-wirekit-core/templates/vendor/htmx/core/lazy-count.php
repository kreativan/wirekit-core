<?php namespace ProcessWire; ?>

<?php if($input->get->s == "4") :?>
  <p 
    id="lazy-count"
    hx-get="<?= $htmx->url ?>vendor/htmx/core/lazy-count/"
    hx-trigger="load delay:1s"
    hx-vars='{"s": "3"}'
  >
    Content below will be lazy loaded with a <b class="wk-anim-fade">4s</b> delay...
  </p>
<?php elseif($input->get->s == "3") :?>
  <p 
    id="lazy-count"
    hx-get="<?= $htmx->url ?>vendor/htmx/core/lazy-count/"
    hx-trigger="load delay:1s"
    hx-vars='{"s": "2"}'
  >
    Content below will be lazy loaded with a <b class="wk-anim-fade">3s</b> delay...
  </p>
<?php elseif($input->get->s == "2") :?>
  <p 
    id="lazy-count"
    hx-get="<?= $htmx->url ?>vendor/htmx/core/lazy-count/"
    hx-trigger="load delay:1s"
    hx-vars='{"s": "1"}'
  >
    Hold on... Only <b class="wk-anim-fade">2</b> seconds more...
  </p>
<?php elseif($input->get->s == "1") :?>
  <p 
    id="lazy-count"
    hx-get="<?= $htmx->url ?>vendor/htmx/core/lazy-count/"
    hx-trigger="load delay:1s"
    hx-vars='{"s": "0", "title": "Lazy Loaded Content Title"}'
  >
    Hold on... Only <b class="wk-anim-fade">1</b> more second...
  </p>
<?php elseif($input->get->s == "0") : ?>
  <?php render("vendor/htmx/core/lazy.php"); ?>
<?php endif;?>
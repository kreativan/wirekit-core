<?php namespace ProcessWire; ?>

<p class="uk-text-muted" 
  hx-get="<?= $htmx->url ?>vendor/htmx/blank" 
  hx-target="#skip-lazy-count" 
  hx-trigger="load"
  hx-swap="outerHTML"
>
  Lazy content has been loaded
</p>

<h3 class="uk-margin"><?= $input->get->title ?></h3>

<a class="uk-button uk-button-primary" href="#" 
  <?= $htmx->getModal("vendor/htmx/pro/modal/"); ?>
>
  htmx modal
</a>

<a class="uk-button uk-button-primary" href="#" 
  <?= $htmx->getOffcanvas("vendor/htmx/pro/offcanvas/"); ?>
>
  htmx offcanvas
</a>

<a class="uk-button uk-button-default" href="#" 
  <?= $htmx->getPage($pages->get("/")) ?>
>
  Back To Home
</a>

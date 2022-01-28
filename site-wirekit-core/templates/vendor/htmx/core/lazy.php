<?php namespace ProcessWire; ?>

<p class="wk-text-muted"
  hx-get="<?= $htmx->url ?>vendor/htmx/blank/" 
  hx-target="#skip-lazy-count" 
  hx-trigger="load"
  hx-swap="outerHTML"
>
Lazy content has been loaded</p>

<h3 class="wk-margin"><?= $input->get->title ?></h3>

<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Incidunt est minima et totam placeat eveniet nobis omnis, voluptatum earum magni officia at odit accusantium eum quod libero velit ipsa vero.</p>


<button type="button" class="wk-btn wk-btn-primary"
  <?= $htmx->page($pages->get("/")) ?>
>
  Go Back Home
</a>
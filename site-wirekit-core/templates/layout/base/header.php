<?php namespace ProcessWire; ?>

<div class="wk-container wk-pos-relative">

  <div id="navbar" class="wk-flex wk-flex-middle wk-flex-between wk-pos-relative">

    <div id="logo">
        <?php if(!empty($system->logo)) : ?>
        <a class="logo" href="<?= $pages->get("/")->url ?>">
          <img src="<?= $system->logo->url ?>" alt="<?= $system->settings("site_name") ?>" />
        </a>
        <?php else : ?>
        <h3 class="wk-margin-remove wk-text-bold wk-text-up">
          <a class="wk-reset-link" href="<?= $pages->get("/")->url ?>">
            <em><?= $system->settings("site_name") ?></em>
          </a>
        </h3>
        <?php endif;?>
    </div>

    <div id="navigation" class="wk-visible-tablet">
      <?php render("layout/menu/navbar.php"); ?>
    </div>

    <div id="mobile-menu-button" class="wk-hidden-tablet">
      <button class="wk-reset-btn wk-flex wk-flex-middle" type="button" 
        onclick="wirekit.mobileMenu('<?= $page->id ?>')"
      >
        <?php svg("menu", ["size" => "36px","color" => "#111",]); ?>
        <?php svg("close", ["size" => "36px","color" => "#111",]); ?>
      </button>
    </div>

  </div>

  <div id="mobile-menu-container" class="wk-hidden-tablet">
    <!-- we will inject mobile-menu here -->
  </div>

</div>
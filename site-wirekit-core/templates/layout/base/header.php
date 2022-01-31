<?php namespace ProcessWire; ?>

<div class="w-container w-pos-relative">

  <div id="navbar" class="w-flex w-flex-middle w-flex-between w-pos-relative">

    <div id="logo">
        <?php if(!empty($system->logo)) : ?>
        <a class="logo" href="<?= $pages->get("/")->url ?>">
          <img src="<?= $system->logo->url ?>" alt="<?= $system->settings("site_name") ?>" />
        </a>
        <?php else : ?>
        <h3 class="w-margin-remove w-text-bold w-text-up">
          <a class="w-reset-link" href="<?= $pages->get("/")->url ?>">
            <em><?= $system->settings("site_name") ?></em>
          </a>
        </h3>
        <?php endif;?>
    </div>

    <div id="navigation" class="w-visible-tablet">
      <?php render("layout/menu/navbar.php"); ?>
    </div>

    <div id="mobile-menu-button" class="w-hidden-tablet">
      <button class="w-reset-btn w-flex w-flex-middle" type="button" 
        onclick="wirekit.mobileMenu('<?= $page->id ?>')"
      >
        <?php svg("menu", ["size" => "36px","color" => "#111",]); ?>
        <?php svg("close", ["size" => "36px","color" => "#111",]); ?>
      </button>
    </div>

  </div>

  <div id="mobile-menu-container" class="w-hidden-tablet">
    <!-- we will inject mobile-menu here -->
  </div>

</div>
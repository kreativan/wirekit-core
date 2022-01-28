<?php namespace ProcessWire; 
/**
 *  Mobile Menu
 *  @var string|integer page_id - current page id
 *  @example onclick='mobileMenu(123)' 
 */

// get mobile menu
$id = $modules->get("MenuManager")->mobile_menu_source;
$menu = $pages->get("id=$id");
?>

<ul id="mobile-menu" class="wk-reset-list">
  <?php foreach($menu->items() as $item) : ?>
  <?php if($item["is_visible"]) : ?>
  <li class="<?= menuItemClass($item, "wk-") ?>">
    <a href="<?= $item["href"] ?>" title="<?= $item["link_title"] ?>" <?= $item["attr"] ?> 
      <?php if($item["submenu"]) :?>
        onclick="wkui.toggle()"
      <?php endif;?>
    >
      <?= $item["title"] ?>
    </a>
    <?php if($item["submenu"] && $item["submenu_type"] == "custom") :?>
      <ul class="menu-subnav wk-reset-list">
        <?php foreach($item["submenu"] as $subitem) :?>
          <li class="<?= menuItemClass($subitem, "wk-") ?>">
            <a href="<?= $subitem["href"] ?>" title="<?= $subitem["link_title"] ?>" <?= $subitem["attr"] ?>>
              <?= $subitem["title"] ?>
            </a>
          </li>
        <?php endforeach; ?>
      </ul>
    <?php endif;?>
  </li>
  <?php endif;?>
  <?php endforeach; ?>
</ul>

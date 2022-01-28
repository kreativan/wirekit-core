<?php namespace ProcessWire; ?>

<ul class="navbar-menu">

  <?php foreach(mainMenu() as $item) : ?>
    
    <li class="<?= menuItemClass($item, "wk-") ?>">

      <a href="<?= $item["href"] ?>" 
        title="<?= $item["link_title"] ?>" 
        <?= $item["attr"] ?>
      >
        <?= $item["title"] ?>
      </a>

      <?php // Child Pages or Repeater Items Dropdown ?>

      <?php if($item["submenu_type"] == "child-pages" && $item["page_id"] != null) :?>

        <?php
          $child_pages = $pages->get("id={$item["page_id"]}")->children();
        ?>
        
        <div class="navbar-menu-dropdown wk-anim-fade wk-anim-fast">
          <ul class="navbar-menu-dropdown-nav">
            <?php foreach($child_pages as $child) :?>
              <li>
                <a href="<?= $child->url ?>" title="<?= $child->title ?>">
                  <?= $child->title ?>
                </a>
              </li>
            <?php endforeach;?>
          </ul>
        </div>

      <?php elseif ($item["submenu_type"] == "custom" && $item["submenu"]) : ?>

        <div class="navbar-menu-dropdown wk-anim-fade wk-anim-fast">
          <ul class="navbar-menu-dropdown-nav">
            <?php foreach($item["submenu"] as $subitem) :?>
              <li class="<?= menuItemClass($subitem, "wk-") ?>">
                <a href="<?= $subitem["href"] ?>" 
                  title="<?= $subitem["link_title"] ?>" 
                  <?= $subitem["attr"] ?> 
                >
                  <?= $subitem["title"] ?>
                </a>
              </li>
            <?php endforeach;?>
          </ul>
        </div>

      <?php endif;?>
      
    </li>

  <?php endforeach; ?>

</ul>


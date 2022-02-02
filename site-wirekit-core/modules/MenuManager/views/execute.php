<?php namespace ProcessWire;
/**
 *  Execute.php
 *  @param object $this_module
 *  @param string $page_name
 *  @author Ivan Milincic <kreativan.dev@gmail.com>
 *  @link http://kraetivan.dev
*/

include("_new.php");
include("_tabs.php");

?>

<div class="ivm-bg-white ivm-border">
  <form action="./" method="POST">
    <table class="uk-table uk-table-striped uk-table-middle uk-margin-remove">

      <thead>
        <tr>
          <th></th>
          <th>Title</th>
          <th>Link Type</th>
          <th>Link</th>
          <th>Submenu</th>
          <th></th>
        </tr>
      </thead>

      <tbody id="ivm-sortable">
        <?php if($items->count) :?>
        <?php foreach($items as $item) :?>

        <?php
          $class = $item->isHidden() || $item->isUnpublished() ? "is-hidden" : "";
          $link_type = $item->link_type->name;

          $link = "-";
          if(($link_type == 'page' || $link_type == "page-ajax") && !empty($item->select_page)) {
            $page_link = $this->pages->get("id={$item->select_page}");
            if($page_link->parent->id == "1") {
              $link =  "/{$page_link->name}/";
            } else {
              $link = "/{$page_link->parent->name}/{$page_link->name}/";
            }
          } elseif($link_type == 'none') {
            $link = "-";
          } else {
            $link = $item->link;
          }
        ?>

        <tr class="ajax-item <?= $class ?>" data-sort="<?= $item->sort ?>" data-id="<?= $item->id ?>">

          <td class="uk-table-shrink">
            <div class="handle">
              <i class='fa fa-bars'></i>
            </div>
          </td>

          <td>
            <a href="<?= $wirekit->pageEditLink($item->id) ?>">
              <?= $item->title ?>
            </a>
          </td>

          <td class="uk-text-small">
            <em>
              <?= $item->link_type->title ?>
            </em>
          </td>

          <td class="uk-text-small">
            <?= $link ?>
          </td>

          <td class="uk-text-small">
            <?php 
              if($item->submenu_type == "2") {
                echo "custom ({$item->menu->count})";
              } elseif($item->submenu_type == "3") {
                echo "child pages";
              }
            ?>
          </td>

          <td class="ivm-actions uk-text-right" style="width: 120px;padding-right: 20px;">
            <button class="btn" onclick="wirekit.togglePage(<?= $item->id ?>)" title="Show / Hide" uk-tooltip>
              <i class="fa fa-toggle-<?= $item->isUnpublished() ? "off" : "on" ?> fa-lg"></i>
            </button>
            <button class="btn uk-text-danger" onclick="wirekit.trashPage(<?= $item->id ?>)" title="Trash" uk-tooltip>
              <i class="fa fa-times-circle fa-lg"></i>
            </button>
          </td>

        </tr>
        <?php endforeach; ?>
        <?php else :?>
        <tr>
          <td colspan="100%">
            <h3 class='uk-margin-remove'>No items to display</h3>
          </td>
        </tr>
        <?php endif;?>
      </tbody>

    </table>
  </form>
</div>
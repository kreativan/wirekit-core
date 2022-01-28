<?php namespace ProcessWire;
/**
 *  Drop Menu
 *  is included in table...
 *  @var $item
*/

?>

<div class="uk-inline uk-margin-right">

  <a href="#" class="uk-icon-button" uk-icon="more-vertical"></a>

  <div uk-drop="mode: click;pos: right-center" class="uk-drop uk-drop-right-center" style="width: auto;">
    <div class="ivm-drop-menu uk-text-left">
      <ul class="uk-nav uk-nav-default" uk-nav>

        <!-- Edit -->
        <li>
          <a href="<?= $helper->pageEditLink($item->id) ?>">
            <i class="fas fa-pen-alt uk-text-emphasis"></i>
            Edit
          </a>
        </li>

        <!-- Delete -->
        <li>
          <a href="<?= $helper->actionURL("trash", $item->id) ?>" onclick="modalConfirm()">
            <i class="ivm-in-drop-icon fas fa-trash uk-text-danger"></i>
            Trash
          </a>
        </li>

      </ul>
    </div>
  </div>

</div>

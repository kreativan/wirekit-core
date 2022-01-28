<?php
/**
 *  Tabs Admin UI
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2018 Kreativan
 *
 *  @var string $page_name
 *  @see includeAdminFile()
 *
*/

?>


<ul class="uk-tab uk-position-relative">

  <li class="<?= ($page_name == "main") ? "uk-active" : "" ?>">
    <a href="<?= $page->url ?>">
      All
    </a>
  </li>

</ul>

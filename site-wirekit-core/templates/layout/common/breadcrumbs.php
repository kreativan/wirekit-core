<?php namespace ProcessWire;
/**
 *  Breadcrumb
 *
 *  @var string $align left/center/right
 *  @var string $class
 *  @var integer $word_limit
*/

$class  = !empty($class) ? " $class" : "";
$word_limit = !empty($word_limit) ? $word_limit : 25;

?>

<ul class="w-breadcrumb<?= $class ?>">

  <?php foreach($page->parents() as $item) :?>
    <li>
      <a href="<?= $item->url ?>" title="<?= $item->title ?>">
        <?= $sanitizer->truncate($item->title, $word_limit); ?>
      </a>
    </li>
  <?php endforeach;?>

  <li class="w-active">
    <span>
      <?= $sanitizer->truncate($page->title, $word_limit); ?>
    </span>
  </li>

</ul>

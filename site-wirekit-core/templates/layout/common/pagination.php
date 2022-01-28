<?php namespace ProcessWire;
/**
 *  Pagination
 *
 *  @var PageArray $items
 *  @var string $class
 *  @var string $urlSegment
*/

$items = !empty($items) ? $items : "";
$class = !empty($class) ? $class : "";
$urlSegment = !empty($urlSegment) ? $urlSegment : "";

if($items->count) {

  $pagination = $items->renderPager(array(
    'nextItemLabel'                 => '<span>-></span>',
    'previousItemLabel'             => '<span><-</span>',
    'nextItemClass'                 => "pagination-next",
    'previousItemClass'             => "pagination-prev",
    'lastItemClass'                 => "pagination-last",
    'currentItemClass'              => "wk-active",
    'listMarkup'                    => "<ul class='wk-pagination $class'>{out}</ul>",
    'itemMarkup'                    => "<li class='{class} wk-margin-remove'>{out}</li>",
    'linkMarkup'                    => "<a href='{url}{$urlSegment}'><span>{out}</span></a>"
  ));

  echo $pagination;

}

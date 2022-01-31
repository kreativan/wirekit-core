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
    'currentItemClass'              => "w-active",
    'listMarkup'                    => "<ul class='w-pagination $class'>{out}</ul>",
    'itemMarkup'                    => "<li class='{class} w-margin-remove'>{out}</li>",
    'linkMarkup'                    => "<a href='{url}{$urlSegment}'><span>{out}</span></a>"
  ));

  echo $pagination;

}

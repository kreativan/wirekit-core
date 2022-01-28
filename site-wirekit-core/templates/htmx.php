<?php namespace ProcessWire;
/**
 *  This is where dynamic content is rendered
 *  This page should always return html
 *
 *  Use @var $htmx->url to get the html root url
 *
 *  You can access this page on: {$htmx->url}folder/file/
 *
 *  @example {$htmx->url}layout/product/card/
 *  will render /layout/product/card.php
 * 
 *  Any file up to 4 levels, from allowed paths
 *  @example {$htmx->url}folder/sub_1/sub_2/sub_3/file
 * 
 *  All $_GET variables are passed as data to the file
 *  @example {$htmx->url}layout/my-file/?key=value 
 *  @example echo $key
 * 
 *  Pages
 *  $page is automatically passed as data to the render files
 *  Add ?htmx=1 to exclude header and footer
 *  @example {$htmx->url}page/1047/?htmx=1
 *  @example {$htmx->url}page/?page_id=1047
 *  @example {$htmx->url}page/?page_url=1047
 *  @example {$htmx->url}page/?page_url=1047&page_ref=product
 * 
 *  Page Reference
 *  Add page_ref variable to reference the $page
 *  in this example $page and $product will be the same
 *  @example {$htmx->url}/layout/card/?page_id=123&page_ref=product
 * 
 */

require_once("_init.php");

// is allowed?
$allowed_paths = setting("htmx_allowed_paths");
if(!$htmx->allowHTMX($allowed_paths)) throw new Wire404Exception();

$htmx_file = $htmx->htmxFile();
$htmx_data = $htmx->htmxData();

render($htmx_file, $htmx_data);

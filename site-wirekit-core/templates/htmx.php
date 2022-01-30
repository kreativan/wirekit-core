<?php namespace ProcessWire;
/**
 *  HTMX end-point
 *  This page should always return html
 *  Use @var $htmx->url as end-point root url
 *  
 *  Get content with url segments: {$htmx->url}folder/file/
 *  @example {$htmx->url}layout/product/card/
 *  will render /layout/product/card.php
 * 
 *  Any file up to 4 segments from allowed paths are supported
 *  @example {$htmx->url}folder/sub_1/sub_2/sub_3/file/
 * 
 *  # $_GET
 *  All $_GET variables are passed as data to the file
 *  @example {$htmx->url}layout/my-file/?key=value 
 *  @example echo $key
 * 
 *  # Pages
 *  Use page segment to render the page
 *  @example {$htmx->url}page/1047/
 *  Add ?htmx=1 to exclude header and footer
 *  @example {$htmx->url}page/1047/?htmx=1
 * 
 *  # Page
 *  Pass the page object to the the render file with page_id or page_url
 *  @example {$htmx->url}page/?page_id=1047
 *  @example {$htmx->url}page/?page_url=/basic-page/
 * 
 *  # Page Reference
 *  Add page_ref variable to reference the $page
 *  in this example $page and $product will be the same
 *  @example {$htmx->url}/layout/card/?page_id=123&page_ref=product
 *  
 *  @see /classes/HtmxPage.php for more info
 */

require_once("_init.php");

// is allowed?
if(!$htmx->allowHTMX()) throw new Wire404Exception();

$htmx_file = $htmx->htmxFile();
$htmx_data = $htmx->htmxData();

render($htmx_file, $htmx_data);

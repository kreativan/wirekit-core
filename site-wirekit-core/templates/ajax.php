<?php namespace ProcessWire;
/**
 *  This is where ajax request should end up
 *  We will execute ajax files based on urlSegment
 *  Up to 2 segments are supported /ajax/file-name/ or /ajax/folder/file-name/
 *  @example /ajax/content/ will call for: /ajax/contact.php file
 *  @example /ajax/users/login/ will call for: /ajax/users/login.php
 */

$file = "";

if($input->urlSegment2) {
  $file = "ajax/{$input->urlSegment1}/{$input->urlSegment2}.php";
} elseif($input->urlSegment1) {
  $file = "ajax/{$input->urlSegment1}.php";
}

// Render File
if(file_exists($file)) { 
  $files->include($file);
} elseif(file_exists("vendor/{$file}")) {
  $files->include("vendor/$file");
} else {
  throw new Wire404Exception();
}
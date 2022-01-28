<?php namespace ProcessWire;

if ($page->name != "http404" && $page->seo) {
  echo $page->seo;
}
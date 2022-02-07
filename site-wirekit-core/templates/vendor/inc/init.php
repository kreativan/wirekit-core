<?php namespace ProcessWire;
/**
 *  init.php
 *  this file is included in /templates/_init.php
 *  Used by the core to possibly add new features through updates
 */

// func
include_once($config->paths->vendor . "func/cms.php");

//  Translator
if($modules->isInstalled("Translator")) {
  $translator = $modules->get("Translator");
  $translator_lang_name = !empty($user->language) ? $user->language->name : "default";
  wireLangReplacements($translator->array($translator_lang_name));
}

// Run page init method if exists
if(method_exists($page, 'init')) $page->init();

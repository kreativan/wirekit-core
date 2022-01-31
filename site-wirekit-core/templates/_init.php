<?php namespace ProcessWire;
/**
 * Initialization file for template files
 *
 * This file is automatically included as a result of $config->prependTemplateFile
 * option specified in your /site/config.php.
 *
 * You can initialize anything you want to here. In the case of this beginner profile,
 * we are using it just to include another file with shared functions.
 *
 */

include_once($config->paths->vendor . "inc/init.php");
include_once($config->paths->vendor . "func/media.php");
include_once($config->paths->vendor . "func/menu.php");

// Cache buster suffix
$suffix = "";
if($config->debug) $suffix = "?" . time();

/**
 *  Global Settings
 *  using setting() functions API
 */
setting([
  
  "preprocessor" => "less", // less or scss
  "overrides" => false, // overrides in /layout-ovrr/ or specified folder
  "dynamic_assets" => true, // use loadJS() and  loadCSS()
  "https" =>  true, // is https enabled?
  "htmx" => true, // load htmx.org lib in head
  "htmx_allowed_paths" => ["htmx", "page", "layout"], // end-points: /htmx/*/

  /**
   *  Header & footer
   *  Define custom header and footer files paths, 
   *  relative to the templates folder.
   *  To skip rendering any of them set path to "/"
   */
  "header" => "layout/base/header.php",
  "footer" => "layout/base/footer.php",
  "mobile_header" => "/",

  /**
   *  Meta Tags
   *  Set default meta tags here
   */
  "meta" => [
    "title" => $page->title,
    "description" => "",
    "image" => "",
    "generator" => "wirekit.dev",
  ],

  // css files to load in head
  "css_files" => [],

  // js files to load in head
  "js_files" => [
    $config->urls->lib . "js/wirekit-core.js",
    $config->urls->lib . "js/wirekit-ui.js",
  ],

  // less files to compile
  "less_files" => [
    $config->paths->lib . "less/svg.less",
    $config->paths->lib . "less/htmx.less",
    $config->paths->lib . "wkui-dev/import.less",
    $config->paths->templates . "less/style.less",
  ],

  // Google Fonts Link
  "google_fonts_link" => "https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,300;0,400;1,300;1,400;1,700&display=swap",

  /**
   *  Override Less variables...
   *  In this array you can set/override less variables.
   *  @example ["global-font-family" => $system->font_family]
   */
  "less_vars" => [
    "w-font" => "Jost, Sans Serif",
    "w-font-base" => "Jost, Sans Serif",
  ],

  // expose some js varibles
  // access them with cms variable eg: cms.debug
  "js_vars" => [
    "debug" => $config->debug,
    "lang" => ($user->language) ? $user->language->name : null,
    "htmx" => $htmx->url,
    "ajax" => $ajax->url,
    "mobileMenuPath" => "layout/menu/mobile-menu/",
  ],

]);
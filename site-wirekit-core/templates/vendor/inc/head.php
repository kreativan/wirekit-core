<?php namespace ProcessWire;
// Header
// You can override path to the header layout files in setting()
$header = setting("header") ? setting("header") : "layout/base/header.php";
$mobile_header = setting("mobile_header") ? setting("mobile_header") : "layout/base/mobile-header.php";

//  Setting - from the _init.php
$js_files = setting("js_files");
$js_vars = setting("js_vars");
$css_files = setting("css_files");
$google_fonts_link = setting("google_fonts_link");

if(setting("preprocessor") == "less") {
  $less_files = setting("less_files");
  $less_vars = setting("less_vars");
}

/**
 *  Custom - passed in head() function
 *  @var array js => js files to load in <head>
 *  @var array css => css files to load in <head>
 *  @var string meta_title
 */

// js
$custom_js = !empty($js) ? $js : false;
if($custom_js) {
  $js_files = array_merge($js_files , $custom_js);
  array_unique($js_files);
}

// css
$custom_css = !empty($css) ? $css : false;
if($custom_css) {
  $css_files = array_merge($css_files , $custom_css);
  array_unique($css_files);
}

// Meta file and meta_data
$meta_data = !empty($meta) ? $meta : setting("meta");
$meta_file = $config->paths->templates . "vendor/inc/meta.php";
$_meta_file = $config->paths->templates . "_meta.php";
?>

<!DOCTYPE html>
<html lang="<?= $user->lang() ?>">

<head>

  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <?php if(setting("https")) :?>
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> 
  <?php endif;?>

  <?php if($system->favicon()) : ?>
    <!-- browser -->
    <link rel="icon" href="<?= $system->favicon("16") ?>" type="image/png" sizes="16x16">
    <!-- taskbar -->
    <link rel="icon" href="<?= $system->favicon("32") ?>" type="image/png" sizes="32x32">
    <!-- desktop (and google tv) -->
    <link rel="icon" href="<?= $system->favicon("96") ?>" type="image/png" sizes="96x96">
    <!-- android Chrome -->
    <link rel="icon" href="<?= $system->favicon("196") ?>" type="image/png" sizes="196x196">
    <!-- apple touch -->
    <link rel="apple-touch-icon" href="<?= $system->favicon("180") ?>">
  <?php endif;?>

  <?php
    // if _meta use it, if not use /vendor/inc/meta/
    if(file_exists($_meta_file)) {
      $files->include($_meta_file);
    } else {
      $files->include($meta_file, $meta_data);
    }
  ?>

  <!-- Preload Less/scss -->
  <?php if($helper->compiler != "1" && setting("preprocessor") == "less") :?>
  <link rel="preload" href="<?= $config->urls->ass."css/main-less.css"; ?>" as="style">
  <?php elseif($helper->compiler != "1" && setting("preprocessor") == "scss") :?>
  <link rel="preload" href="<?= $helper->scss() ?>" as="style">
  <?php endif; ?>  
  
  <!-- Preload CSS -->
  <?php if(count($css_files) > 0) : ?>
  <?php foreach($css_files as $css_file) : ?>
  <link rel="preload" href="<?= $css_file ?>" as="style">
  <?php endforeach;?>
  <?php endif;?>

  <!-- Google Fonts -->
  <?php if($google_fonts_link && !empty($google_fonts_link)) : ?>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="preload" as="style" href="<?= $google_fonts_link ?>">
  <link href="<?= $google_fonts_link ?>" rel="stylesheet"> 
  <?php endif;?>
    
  <!-- Less/scss -->
  <?php if(setting("preprocessor") == "less") : ?>
  <link rel="stylesheet" type="text/css" href="<?= $helper->less($less_files, $less_vars, "main-less"); ?>">
  <?php elseif(setting("preprocessor") == "scss") :?>
  <link rel="stylesheet" type="text/css" href="<?= $helper->scss(); ?>">
  <?php endif; ?>

  <?php if(count($css_files) > 0) : ?>
  <?php foreach($css_files as $css_file) : ?>
  <link rel="stylesheet" type="text/css" href="<?= $css_file ?>">
  <?php endforeach;?>
  <?php endif;?>

  <!-- js -->
  <?php foreach($js_files as $file) : ?>
  <script defer type='text/javascript' src='<?= $file ?>'></script>
  <?php endforeach; ?>

  <!-- htmx -->
  <?php if(setting("htmx")) : ?>
  <script defer type='text/javascript' src='https://unpkg.com/htmx.org@1.6.1'></script>
  <?php endif;?>

  <script>
  const cms = <?= json_encode($js_vars) ?>;
  </script>

  <?php if($config->debug) : ?>
  <script>console.log(cms);</script>
  <?php endif;?>

  <?php echo $system->scripts_in_head; ?>

</head>

<?php
$body_id = $page->template != "404" ? "{$page->template}-tmpl" : "no-tmpl";
?>

<body id="<?= $body_id ?>">
    
  <header id="header">
    <?php
      if($mobile_header != "/") render($mobile_header);
    ?>

    <?php
      if($header != "/") render($header);
    ?>
  </header>

  <main id="main">
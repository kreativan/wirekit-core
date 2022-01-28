<?php namespace ProcessWire;

// load js
function loadJS($js) {
  $js = wire("config")->debug ? $js . "?v=". time() : $js;  
  wire('config')->scripts->add($js);
}

// load css
function loadCSS($css) {
  $css = wire("config")->debug ? $css . "?v=". time() : $css;  
  wire('config')->styles->add($css);
}

function head($array = []) {
  if(wire("input")->get->htmx == "1") return;
  $file = wire("config")->paths->templates . "vendor/inc/head.php";
  return wire("files")->include($file, $array);
}

function foot($array = []) {
  if(wire("input")->get->htmx == "1") return;
  $file = wire("config")->paths->templates . "vendor/inc/foot.php";
  return wire("files")->include($file, $array);
}

// Render (include file shorthand and layout overrides)
function render($file_path, $vars = []) {
  $render_file = wire("config")->paths->templates . $file_path;
  if(setting("overrides")) {
    $ovrr_folder = "layout-ovrr";
    if(setting("overrides") !== true) $ovrr_folder = setting("overrides");
    $file_path_ovrr = str_replace("layout", $ovrr_folder, $file_path);
    $file_overr = wire("config")->paths->templates . "{$file_path_ovrr}";
    if(file_exists($file_overr)) $render_file = $file_overr;
  }
  if(file_exists($render_file)) {  
    return wire("files")->include($render_file, $vars);
  } elseif (wire("config")->debug) {
    echo "<div><code>$render_file</code> doesn't exist;</div>";
  }
}
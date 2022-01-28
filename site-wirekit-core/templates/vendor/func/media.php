<?php namespace ProcessWire;
//-------------------------------------------------------- 
//  Picture
//-------------------------------------------------------- 

/**
 *  Render image in <picture> tag with webp support
 *  @param image|object $img
 *  Options:
 *  @param string|bool watermark - use "true" to enable @see watermark()
 *  @param int width - image width
 *  @param int height - image height
 *  @param string crop - crop position: center, north etc...
 *  @param string alt - image alt tag
 *  @param string lazy - use "false" to disable
 *  @param string class - css class for <picture> tag
 *  @param string $img_class - css class for <img /> tag
 *  @param string|bool $fit_img - add uk-width-1-1 class to the image
 *  Sources:
 *  @param array $source - add additional sources
 *  @example $source = ["max-width: 600px" => "my-image.jpg";
 */
function picture($img, $options = []) {

  $watermark = !empty($options["watermark"]) && $options["watermark"] == "true" ? true : false;
  $width = !empty($options["width"]) ? $options["width"] : "";
  $height = !empty($options["height"]) ? $options["height"] : "";
  $crop = !empty($options["crop"]) ? $options["crop"] : "center";
  $alt = !empty($options["alt"]) ? $options["alt"] : "";
  $lazy = !empty($options["lazy"]) && $options["lazy"] == "false" ? false : true;
  $class = !empty($options["class"]) ? $options["class"] : "";
  $img_class = !empty($options["img_class"]) ? $options["img_class"] : "";

  $source = !empty($options["source"]) ? $options["source"] : [];

  $image = "";
  $image_w = "";

  if ($width != "" && $height != "") {
    $image = $img->size($width, $height, $crop);
    if($watermark) $image_w = watermark($img)->size($width, $height, $crop);
  } elseif ($width != "") {
    $image = $img->width($width);
    if($watermark) $image_w = watermark($img)->width($width);
  } elseif ($height != "") {
    $image = $img->height($height);
    if($watermark) $image_w = watermark($img)->height($height);
  } else {
    $image = $img;
    if($watermark) $image_w = watermark($img);
  }

  // watermark or not
  $picture = $watermark ? $image_w : $image;

  // lazy load or not
  $imgAttr = $lazy ? "loading='lazy'" : "";

  // Satrt <picture> html
  $html = "<picture class='$class'>";

  // add additional sources if exists
  if(count($source)) {
    foreach($source as $media => $srcset) {
      $html .= "<source media='($media)' srcset='$srcset' />";
    }
  }

  $html .= "<source srcset='{$picture->webp->url}' type='image/webp'>";
  $html .= "<img class='{$img_class}' src='{$picture->url}' alt='$alt' width='$width' height='$height' $imgAttr />";
  $html .= "</picture>";

  echo $html;

}

/**
 *  Add Watermark to an image
 *  @param Image|object $img
 *  @example watermark($page->img)->url
 *  @example watermark($page->height(400)->img)->url
 *
 */
function watermark($img = "") {

  // If pim module is not installed just retun image object
  $isPimInstalled = wire("modules")->isInstalled("PageImageManipulator02");
  if(!$isPimInstalled) return $img;

  // Is watermark enabled?
  $isWatermark = false;

  // watermark position
  // W (left)
  // C (center)
  // E (right),
  // N (top), NW (top-left), NE (top-right)
  // S (bottom), SW (bottom-left), SE (bottom-right)
  $position = "C";

  // watermark image, needs to be png
  $watermark_img = "";

  // recreate watermark on page load
  // this can slow down the site...
  $recreate = false;

  if($isWatermark && $img != "" && $watermark_img != "") {

    $wimage = $img->pim2Load("wtr", $recreate)->watermarkLogo($watermark_img, "{$position}", "20")->pimSave();
    return $wimage;

  } else {

    return $img;

  }

}

/**
 *  Render SVG from /assets/svg/ folder
 *  @param string $svg_file_nam
 *  @param array $options
 *  @return markup
 */
function svg($svg_file_name, $options = []) {

  $svg_ass = wire("config")->paths->ass . "svg/{$svg_file_name}.svg";
  $svg_og = wire("config")->paths->lib . "svg/{$svg_file_name}.svg";
  $svg_file = file_exists($svg_ass) ? $svg_ass : $svg_og;

  if(!file_exists($svg_file)) return false;

  // Options
  $type = !empty($options["type"]) ? $options["type"] : "stroke"; // stroke / fill
  $color = !empty($options["color"]) ? $options["color"] : ""; // hex
  $size = !empty($options["size"]) ? $options["size"] : "28px"; // px
  $class = "svg-$type";
  $class .= !empty($options["class"]) ? " " . $options["class"] : "";
  $sty = !empty($options["style"]) ? $options["style"] : ""; // style=""

  $style = "width:$size;height:$size;";
  if($color != "") {
    $style .= ($type == "stroke") ? "stroke: $color;" : "fill: $color;";
  }
  $style .= !empty($sty) ? " $sty" : "";

  $svg = file_get_contents($svg_file);
  echo "<span class='svg {$class}' style='{$style}'>{$svg}</span>";
}

/**
 *  Render social video post code
 *  @param string $link 
 *  @return markup
 */
function socialVideoPost($link) {
  $str = "<p>$link</p>";
  if(wire("modules")->isInstalled("TextformatterVideoOrSocialPostEmbed")) {
    $textformatter = wire("modules")->get("TextformatterVideoOrSocialPostEmbed");
    $textformatter->format($str);
    return $str;
  } else {
    return "<code>TextformatterVideoOrSocialPostEmbed is missing</code>";
  }
}

/**
 *  Render youtube video
 *  @param string $link 
 *  @return markup
 */
function youtube($link) {
  $str = "<p>$link</p>";
  if($this->modules->isInstalled("TextformatterVideoEmbed")) {
    $textformatter = wire("modules")->get("TextformatterVideoEmbed");
    $textformatter->format($str);
    return $str;
  } else {
    return "<code>TextformatterVideoEmbed is missing</code>";
  }
}

/**
 *  Create data uri’s
 *  embedding images into HTML/CSS/JS
 *  @param string $file - full path to the file
 *  @param string $mime - mediatype eg: image/png, image/jpg...
 */
function dataURI($file, $mime) {
  $contents = file_get_contents($file);
  $base64 = base64_encode($contents);
  echo "data:$mime;base64,$base64";
}
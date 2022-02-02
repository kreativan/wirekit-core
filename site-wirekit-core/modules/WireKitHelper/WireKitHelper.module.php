<?php
/**
 *  WireKit Helper
 *  @author Ivan Milincic <kreativan.dev@gmail.com>
 *  @link https://www.kraetivan.dev
 * 
 *  @method saveModule()
 *  @method formatPageString()
 *  @method minifyCSS()
 *  @method validator()
 *  @method compareVersions()
 * 
*/

class WireKitHelper extends WireData implements Module {

  public static function getModuleInfo() {
    return array(
      'title' => 'WireKit Helper',
      'version' => 100,
      'summary' => 'WireKit Helper module...',
      'icon' => 'code-fork',
      'author' => "Ivan Milincic",
      "href" => "https://kreativan.dev",
      'singular' => true,
      'autoload' => false
    );
  }

  /**
   *  Save Module Settings
   *  @param string $module     module class name
   *  @param array $data        module settings
   */
  public function saveModule($module, $data = []) {
    $old_data = $this->modules->getModuleConfigData($module);
    $data = array_merge($old_data, $data);
    $this->modules->saveModuleConfigData($module, $data);
  }

  /**
   *  Format page strings
   *  extract page variables
   *  @param string $string  eg: {title} or {select_page.url}
   *  @example $this->format("{select_page.url}") will get $page->select_page->url
   *  @return string
   */
  public function formatPageString($string) {
    $page = wire("page");
    $string = ltrim($string);
    $string = preg_replace('/\s\s+/', ' ', $string);
    $text = preg_match_all('#\{(.*?)\}#', $string, $matches);
    $arr = $matches[0];
    $i = 0;
    foreach($arr as $item) {
      $n = $i++;
      $str = $matches[1][$n];
      $str = explode(".", $str);
      $sl1 = $str[0];
      $sl2 = isset($str[1]) ? $str[1] : "";
      $selector = !empty($sl2) ? $page->{$sl1}->{$sl2} : $page->{$sl1};
      $string = str_replace($item, $selector, $string);
    }
    $string = strip_tags($string);
    $string = wire("sanitizer")->removeNewlines($string);
    return $string;
  }

  /**
   *  Minify CSS
   *  @param $css_string
   *  @return string
   */
  public function minifyCSS($css_string) {
    require_once("minify/src/Minify.php");
    require_once("minify/src/Converter.php");
    require_once("minify/src/CSS.php");
    $minifier = new \MatthiasMullie\Minify\CSS();
    $minifier->add($css_string);
    return $minifier->minify();
  }
  
  /**
   * VALITRON Validator
   * Validate Data/Form with Valitron
   * @param array $array
   * @example 
   *    $v = $helper->validator($_POST)
   *    $v = $v->rule('email', 'email');
   *    $v->validate()
   *    $v->errors()      
   */
  public function validator($array) {
    require_once(__DIR__."/valitron/src/Valitron/Validator.php");
    Valitron\Validator::lang($this->user->lang());
    $v = new Valitron\Validator($array);
    return $v;
  }

  /**
   *  Compare Versions
   *  Is 2nd (next) version is higher?
   *  @param string $current eg: 0.0.1
   *  @param string $next eg: 0.0.2
   *  @return bool true
   */
  public function compareVersions($current, $next) {
    $compare = version_compare($current,  $next);
    return ($compare == "-1") ? true : false;
  }

}
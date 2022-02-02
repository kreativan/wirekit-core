<?php
/**
 *  WireKit
 *  @author Ivan Milincic <kreativan.dev@gmail.com>
 *  @link https://www.kraetivan.dev
*/

class WireKit extends WireData implements Module {

  public static function getModuleInfo() {
    return array(
      'title' => 'WireKit',
      'version' => 100,
      'summary' => 'WireKit helper. Admin UI, less parser, helper methods...',
      'icon' => 'codepen',
      'author' => "Ivan Milincic",
      "href" => "https://kreativan.dev",
      'singular' => true,
      'autoload' => true
    );
  }

  public function __construct() {
    $this->module_url = $this->config->urls->siteModules.$this->className();
  }

  public function ready() {

    // Define global vars
    $system_page = $this->pages->get("template=system");
    $htmx_page = $this->pages->get("template=htmx");
    $ajax_page = $this->pages->get("template=ajax");
    $wirekit_module = $this->modules->get("WireKit");

    $this->wire("helper", $wirekit_module, true);
    $this->wire("wirekit", $wirekit_module, true);
    $this->wire("system", $system_page, true);
    $this->wire("htmx", $htmx_page, true);
    $this->wire("ajax", $ajax_page, true);

    // Routing / URL Hooks 
    include("routing.php");

  }

  public function init() {

    // Default Hooks
    include("hooks.php");

    if($this->isAdminPage()) {

      // Clear menu-manager cache
      $this->addHookBefore('Pages::saveReady', function(HookEvent $event) {
        $page = $event->arguments(0);
        if($page->template == "menu-item" && method_exists($page->parent, "clearMenuCache")) {
          $page->parent->clearMenuCache();
        }
      });

      // console.log(ProcessWire.config.wirekit);
      $this->config->js('wirekit', [
        'ajax' => "/ajax/",
        'html' => "/htmx/",
      ]);

      $suffix = ($this->config->debug) ? "?v=".time() : "";
      $this->config->styles->append($this->module_url."/admin.css");
      $this->config->scripts->append($this->module_url."/drag-drop-sort.js");
      $this->config->scripts->append($this->module_url."/wirekit.js{$suffix}");

      include("actions.php");
      include("actions-ajax.php");
      include("actions-ajax-group.php");

      // Drag & drop sort
      if($this->input->post->action == "drag_drop_sort") {
        $id = $this->sanitizer->int($this->input->post->id);
        $p = $this->pages->get($id);
        $next_id = $this->sanitizer->int($this->input->post->next_id);
        $next_page = (!empty($next_id)) ? $this->pages->get($next_id) : "";
        $this->dragDropSort($p, $next_page);
      }

      // run hide pages hook
      $this->addHookAfter('ProcessPageList::execute', $this, 'hidePages');

    }

  }

  /* ----------------------------------------------------------------
    Admin UI
  ------------------------------------------------------------------- */

 /**
  *  Page Edit Link
  *  Use this method to generate page edit link.
  *  @param integer $id  Page ID
  *  @example href='{$this->pageEditLink($item->id)}';
  */
  public function pageEditLink($id) {
    $currentURL = $_SERVER['REQUEST_URI'];
    $url_segment = explode('/', $currentURL);
    $url_segment = $url_segment[sizeof($url_segment)-1];
    // encode & to ~
    $url_segment = str_replace("&", "~", $url_segment);
    $segment1 = $this->input->urlSegment1 ? $this->input->urlSegment1."/" : "";
    return $this->page->url . "edit/?id=$id&back_url={$segment1}{$url_segment}";
  }

  /**
   *  Redirect helper
   *  this should always redirect us where we left off after page save,
   *  back to paginated page, or witg get variables... based on back_url
   *  Run this in a process ___execute() method
   */
  public function redirectHelper() {
    $back_url = $this->session->get("back_url");
    if(!$this->input->get->id) {
      if(!empty($back_url)) {
        // decode back_url:  ~ to &  - see @method pageEditLink()
        $this->session->remove("back_url");
        $back_url = str_replace("~", "&", $back_url);
        $goto = $this->page->url . $back_url;
        $this->session->redirect($goto);
      }
    }
  }

  /**
   * Admin Page Edit
   * from custom ui
   */
  public function adminPageEdit() {

    /**
     *  Set @var back_url session var
     *  So we can redirect back where we left
     */
    if($this->input->get->back_url) {
      // decode back_url:  ~ to &  - see @method pageEditLink()
      $back_url_decoded = str_replace("~", "&", $this->input->get->back_url);
      $this->session->set("back_url", $back_url_decoded);
    }

    /**
     *  Set the breadcrumbs
     *  add $_SESSION["back_url"] to the breacrumb link
     */
    $this->fuel->breadcrumbs->add(new Breadcrumb($this->page->url.$this->session->get("back_url"), $this->page->title));

    // Execute Page Edit
    $processEdit = $this->modules->get('ProcessPageEdit');
    return $processEdit->execute();

  }

  //-------------------------------------------------------- 
  //  Admin Actions
  //-------------------------------------------------------- 

  /**
   *  Drag & Drop Sort
   *  @param Page $p
   *  @param Page $next_page
   */
  public function dragDropSort($p, $next_page) {
    if(empty($p) || $p == "") return;
    if($p->template == "menu-item" && method_exists($p->parent, "clearMenuCache")) $p->parent->clearMenuCache();
    // if no next move to the end
    if(empty($next_page) || $next_page == "") {
      $lastSibling = $p->siblings('include=all, status!=trash')->last();
      $this->pages->insertAfter($p, $lastSibling);
    } else {
      $this->pages->insertBefore($p, $next_page);
    }
  }

  /**
   *  Intercept page tree json and remove page from it
   *  We will remove page by its template
   */
  public function hidePages(HookEvent $event) {

    if($this->user->isSuperuser() && $this->hide_for == "2") return;

    // get system pages
    $sysPagesArr = $this->sys_pages;

    // aditional pages to hide by ID
    $customArr = [];
    if($this->hide_system_pages == "1") {
      $customArr[] = "2"; // admin
      $customArr[] = $this->pages->get("template=system");
    }

    if($this->config->ajax) {

      // manipulate the json returned and remove any pages found from array
      $json = json_decode($event->return, true);
      if($json) {
        foreach($json['children'] as $key => $child){
          $c = $this->pages->get($child['id']);
          $pagetemplate = $c->template;
          if(in_array($pagetemplate, $sysPagesArr) || in_array($c, $customArr)) {
            unset($json['children'][$key]);
          }
        }
        $json['children'] = array_values($json['children']);
        $event->return = json_encode($json);
      }

    }

  }

  //-------------------------------------------------------- 
  //  Helpers
  //-------------------------------------------------------- 

  // Check if current page is admin page
  public function isAdminPage() {
    if(strpos($_SERVER['REQUEST_URI'], $this->wire('config')->urls->admin) === 0) {
      return true;
    } else {
      return false;
    }
  }

  // check if webp is supported
  public function isWebp() {
    return (strpos($_SERVER['HTTP_ACCEPT'], 'image/webp' ) !== false) ? true : false;
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
   * Variables included with the route file
   * @return array
   */
  public function routeData() {

    $array = [];
    $input = wire("input");
    $sanitizer = wire("sanitizer");

    // Set language using lang GET variable
    // eg: ?lang=en
    $language = "";
    if(wire("input")->get->lang) {
      $lang = wire("input")->get->lang;
      $language = wire("languages")->get("id|name|title={$lang}");
      wire("user")->setLanguage($language);
    }
    $array["language"] = $language;

    return $array;

  }

  //-------------------------------------------------------- 
  //  Modules
  //-------------------------------------------------------- 

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
  
  /* =========================================================== 
    Compile Less
  =========================================================== */

  /**
   *  Parse Less
   *  @param array $less_files - array of less file paths
   *  @param array $variables - array of less variables ["my_variable" => "100px"]
   */
  public function compileLess($less_files, $variables = [], $output_file = "less") {

    // load less.php if it is not already loaded
    // a simple require_once does not work properly
    require_once("less.php/lib/Less/Autoloader.php");
    Less_Autoloader::register();
    
    $output_file_name = "{$output_file}.css";
    $css_file_path = $this->config->paths->templates . "assets/css/" . $output_file_name;
    $root_url = "http://" . $this->config->httpHost . $this->config->urls->root;
    $cache_folder = $this->config->paths->assets . "less/";
    $cache_url = $this->config->urls->assets . "less/";

    $less_array = [];
    foreach($less_files as $file) $less_array[$file] = $root_url;

    $options = [
      'cache_dir' => $cache_folder,
      'compress'=> true,
    ];

    $css_file_name = Less_Cache::Get($less_array, $options, $variables);
    $compiled = file_get_contents($cache_folder . $css_file_name);
    file_put_contents($css_file_path, $compiled);

    return $cache_url . $css_file_name;

  }

  public function less($less_files, $variables = [], $output_file = "less") {
    $css_file_path = $this->config->paths->templates."assets/css/{$output_file}.css";
    if($this->compiler == "1" || !file_exists($css_file_path)) {
      return $this->compileLess($less_files, $variables, $output_file);
    } else {
      return $this->config->urls->templates."assets/css/{$output_file}.css";
    }
  }

  /* =========================================================== 
    Sass Compiler
  =========================================================== */

  /**
   *  Trigger scss compile
   *  Put compiled string in a file
   *  return url to the compiled css file
   */
  public function scss() { 

    $scss_dir = $this->config->paths->templates . "scss/";
    $main_scss_path = $this->config->paths->templates."assets/css/main-scss.css";
    $main_scss_url = $this->config->urls->templates."assets/css/main-scss.css";

    // if compiler is off, just return css file url
    if($this->compiler != "1") return $main_scss_url."?{$this->last_compile_time}";

    if($this->needsCompile($scss_dir) || !file_exists($main_scss_path)) {
      $compiled_scss = $this->compileSCSS();
      $this->files->filePutContents($main_scss_path, $compiled_scss);
      $this->saveModule($this, ["last_compile_time" => time()]);
    }

    return $main_scss_url."?{$this->last_compile_time}";

  }

  /**
   *  Compile scss file content and return css string
   *  @param string $folder - main scss folder
   *  @param string $file - main scss file name
   *  @return string
   */
  public function compileSCSS($folder = "", $file = "style.scss") {
    $scss_dir = ($folder != "") ? $folder : $this->config->paths->templates."scss/";
    $scss_file_path = "{$scss_dir}{$file}";
    if (!file_exists($scss_file_path)) return false;
    require_once("scss.php/scss.inc.php");
    $scss = new \ScssPhp\ScssPhp\Compiler();
    $scss->addImportPath($scss_dir);
    $scss_string = file_get_contents($scss_file_path);
    $compiled_scss = $scss->compile($scss_string);
    return $this->minifyCSS($compiled_scss);
  }

  /**
   * Check if there is a file chananges
   * in specified dir and subdirs
   * @param string $folder
   * @return bool
   */
  public function needsCompile($folder) {
    $root_files = glob($folder. "*");
    foreach($root_files as $file) {
      if(is_dir($file)) {
        $files = glob($file."/*");
        foreach($files as $f) {
          $last_time = $this->last_compile_time;
          $this_time = filemtime($f);
          if($this_time > $last_time) return true;
        }
      } elseif ($file != "." && $file != "..") {
        $last_time = $this->last_compile_time;
        $this_time = filemtime($file);
        if($this_time > $last_time) return true;
      }
    }
    return false;
  }

  /* =========================================================== 
    Minify
  =========================================================== */

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

  /* =========================================================== 
    Validator
  =========================================================== */
  
  /**
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

}

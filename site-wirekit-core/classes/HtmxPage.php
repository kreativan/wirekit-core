<?php namespace ProcessWire;

class HtmxPage extends Page {

  /**
   *  HTMX Request
   *  @example $htmx->req($data);
   *  @param array $data
   *  @return string
   */
  public function req($data = []) {

    $get = !empty($data["get"]) ? $data["get"] : false;
    $post = !empty($data["post"]) ? $data["post"] : false;
    if(!$get && !$post) return false;

    $trigger = !empty($data["trigger"]) ? $data["trigger"] : "click";
    $target = !empty($data["target"]) ? $data["target"] : false;
    $swap = !empty($data["swap"]) ? $data["swap"] : false;
    $indicator = !empty($data["indicator"]) ? $data["indicator"] : false;
    $push_url = !empty($data["push_url"]) ? $data["push_url"] : false;
    $vals = !empty($data["vals"]) ? $data["vals"] : false;
    if($vals && is_array($vals)) $vals = json_encode($vals);

    if($get) $attr = "hx-get='{$this->url}{$get}'";
    if($post) $attr = "hx-post='{$this->url}{$post}'";
    $attr .= " hx-trigger='$trigger'";
    if($target) $attr .= " hx-target='$target'";
    if($swap) $attr .= " hx-swap='$swap'";
    if($indicator) $attr .= " hx-indicator='$indicator'";
    if($push_url) $attr .= " hx-push-url='$push_url'";
    if($vals) $attr .= " hx-vals='$vals'";

    return $attr;

  }

  /**
   *  Load page with htmx
   *  @example $htmx->page($page)
   *  @param Page $page
   *  @param string $trigger
   *  @return string
   */
  public function page($page, $trigger = "click") {
    if(empty($page) || $page == "") return false;
    $attr = "hx-get='{$page->url}?htmx=1'";
    $attr .= " hx-trigger='$trigger'";
    $attr .= " hx-target='#main'";
    $attr .= " hx-swap='innerHTML'";
    $attr .= " hx-indicator='#htmx-page-indicator'";
    $attr .= " hx-push-url='{$page->url}'";
    $attr .= " data-title='{$page->title}'";
    $onclick = "wirekit.htmx('page')";
    $attr .= " onclick=$onclick";
    return $attr;
  }

  /**
   *  Trigger UIkit Modal with htmx
   *  Modal markup needs to have id="htmx-modal"
   *  @example $htmx->modal("/layout/login-modal/")
   *  @param string $file_path - modal file path relative to templates folder
   *  @return string;
   */
  public function modal($file_path, $trigger = "click") {
    $path = str_replace(".php", "", $file_path);
    $attr = "hx-get='{$this->url}{$file_path}'";
    $attr .= " hx-trigger='$trigger'";
    $attr .= ' hx-target="body"';
    $attr .= ' hx-swap="beforeend"';
    $onclick = "wirekit.htmx('modal')";
    $attr .= " onclick=$onclick";
    return $attr;
  }

  /**
   *  Trigger UIkit Offcanvas with htmx
   *  Offcanvas markup needs to have id="htmx-offcanvas"
   *  @example $htmx->offcanvas("/layout/login-modal/")
   *  @param string $file_path - offcanvas file path relative to templates folder
   *  @return string;
   */
  public function offcanvas($file_path, $trigger = "click") {
    $path = str_replace(".php", "", $file_path);
    $attr = "hx-get='{$this->url}{$file_path}'";
    $attr .= " hx-trigger='$trigger'";
    $attr .= ' hx-target="body"';
    $attr .= ' hx-swap="beforeend"';
    $onclick = "wirekit.htmx('offcanvas')";
    $attr .= " onclick=$onclick";
    return $attr;
  }

  //-------------------------------------------------------- 
  //  HTMX Route /htmx/
  //--------------------------------------------------------  

  /**
   *  Is file path is allowed
   *  based on htmx_allowed_paths
   *  and custom rules
   *  @return bool
   */
  public function allowHTMX() {
    $allowed_paths = setting("htmx_allowed_paths");
    $segment1 = wire("input")->urlSegment1;
    $segment2 = wire("input")->urlSegment2;
    if (!$segment1) return false;
    if (in_array($segment1, $allowed_paths)) return true;
    if ("/$segment1/$segment2/" == "/vendor/htmx/") return true;
    return false;
  }

  /**
   *  Define file that will be rendered
   *  based on urlSegments
   *  @return string
   */
  public function htmxFile() {

    $file = false;
    $input = wire("input");
    $segment1 = $input->urlSegment1;
    $segment2 = $input->urlSegment2;
    $segment3 = $input->urlSegment3;
    $segment4 = $input->urlSegment4;

    if($input->urlSegment1 == "page") {
      $data = $this->htmxData();
      $page = $data["page"];
      return "{$page->template}.php";
    }

    if($input->urlSegment4) {
      return "{$segment1}/{$segment2}/{$segment3}/{$segment4}.php";
    }
    if($input->urlSegment3) {
      return "{$segment1}/{$segment2}/{$segment3}.php";
    }
    if($input->urlSegment2) {
      return "{$segment1}/{$segment2}.php";
    }
    if($input->urlSegment1) {
      return "htmx/{$segment1}.php";
    }

  }

  /**
   *  Set DATA that will be passed to the htmx render file
   *  All sanitized $_GET variables as $key => value
   *  Set $page on ?page_id=123 or ?page_url=/basic/page/
   *  Set $page_ref ?page_ref=product
   *  Set page based on page segment: /htmx/page/123/
   *  @return array
   */
  public function htmxData() {

    $data = [];
    $input = wire("input");
    $sanitizer = wire("sanitizer");

    if($input->get) {

      /**
       *  All $_GET variables ?key=value
       *  @example echo $key
       */
      foreach($input->get as $key => $val) {
        $value = $sanitizer->text($val);
        $data[$key] = $value;
      }

      /**
       *  Set $page based on page_id
       *  @example ?page_id=123
       */
      if($input->get->page_id) {
        $page_id = $sanitizer->int($input->get->page_id);
        $page = wire("pages")->get($page_id);
        if($page != "") $data["page"] = $page;
      }

      /**
       *  Set $page based on page_url
       *  @example ?page_url=/basic-page/
       */
      if($input->get->page_url) {
        $page_url = $sanitizer->text($input->get->page_url);
        $page = wire("pages")->get("$page_url");
        $data["page"] = $page;
      }

      /**
       *  Use page_ref to set page reference
       *  @example ?page_ref=product
       *  @example ?page_id=1047&page_ref=product 
       *  In this case $page will become $product
       *  So instead of $page->title will be $product->title
       */
      if(($input->get->page_id || $input->get->page_url) && $input->get->page_ref) {
        $page_ref = $sanitizer->text($input->get->page_ref);
        $data[$page_ref] = $page;
      }

    }

    /**
     *  Page segment
     *  Set page data based on segment2
     *  @example /htmx/page/123/
     *  Also, set ?page_ref=product if exists
     */
    if($input->urlSegment1 == "page") {
      if ($input->urlSegment2) {
        $id = $sanitizer->int($input->urlSegment2);
        $page = wire("pages")->get($id);
        $data["page"] = $page;
      }
      if($input->get->page_ref) {
        $page_ref = $sanitizer->text($input->get->page_ref);
        $data[$page_ref] = $page;
      }
    } 

    return $data;

  }

}
<?php namespace ProcessWire;

class MenuPage extends Page {

  private function shortcodes() {
    $shortcodes = [
      "{{home}}" => wire("pages")->get("/")->url,
      "{{system}}" => wire("system")->url,
      "{{htmx}}" => wire("htmx")->url,
      "{{lang}}" => wire("user")->language,
    ];
    return $shortcodes;
  }

  /**
   *  Get menu items
   *  Create menu array and cache it in json file
   *  if present, json file will be used, to avoid processing
   *  each time menu-item is saved cache is cleared.
   *  @param bool $show_home
   *  @param bool $cache 
   *  @return array
   */
  public function items($options = [], $custom_items = []) {

    $show_home = isset($options["show_home"]) && $options["show_home"] === "false" ? false : true;
    $cache = isset($options["cache"]) && $options["cache"] === "false" ? false : true;
    $prefix = isset($options["prefix"]) ? $options["prefix"] : "";

    if($cache && $this->getCachedMenu() && !wire("config")->debug) {
      return $this->getCachedMenu();
    }

    $menu_array = [];

    if($show_home) {
      $home = wire("pages")->get("/");
      $menu_array[] = [
        "id" => $home->id,
        "page_id" => $home->id,
        "title" => __("Home"),
        "link_title" => $home->title,
        "link_type" => "home",
        "href" => $home->url,
        "attr" => $this->homeAttr(),
        "is_parent" => false,
        "is_visible" => true,
        "is_subitem" => false,
        "submenu_type" => null,
        "submenu" => false,
      ];
    }

    foreach($this->children() as $item) {
      
      if($this->isVisible($item)) {
        $item_array = [
          "id" => $item->id,
          "page_id" => $this->targetPage($item),
          "title" => $item->title,
          "link_type" => $item->link_type->name,
          "link_title" => !empty($item->link_title) ? $item->link_title : $item->title,
          "href" => $this->href($item),
          "attr" => $this->attr($item),
          "is_parent" => $this->isParent($item),
          "is_visible" => $this->isVisible($item),
          "is_subitem" => false,
          "submenu_type" => $item->submenu_type->name,
          "submenu" => false,
        ];

        if($item->menu->count) {
          $submenu_array = [];
          foreach($item->menu as $subitem) {
            if($this->isVisible($subitem)) {
              $subitem_array = [
                "id" => $subitem->id,
                "page_id" => $this->targetPage($subitem),
                "title" => $subitem->title,
                "link_type" => $subitem->link_type->id,
                "link_title" => !empty($subitem->link_title) ? $subitem->link_title : $subitem->title,
                "href" => $this->href($subitem),
                "attr" => $this->attr($subitem),
                "is_visible" => $this->isVisible($subitem),
                "is_subitem" => true,
              ];
              $submenu_array[] = $subitem_array;
            }
          }
          $item_array["submenu"] = $submenu_array;
        }

        $menu_array[] = $item_array;
      }

    }

    // Add custom items to the menu array
    /**  Example Array
    ***************************************
      $custom_items = [
        "Custom Item" => [
          "title" => "CTA Button",
          "link_title" => "CTA Button",
          "href" => "#",
          "attr" => "target='_blank'",
          "submenu" => false,
          "page_id" => null,      
        ],
        "Custom Item 2" => [
          "title" => "CTA Button 2",
          "link_title" => "CTA Button 2",
          "href" => "#",
          "attr" => "target='_blank'",
          "submenu" => false,
          "page_id" => null,      
        ],
      ];
      ************************************
    */
    foreach($custom_items as $item) {
      $menu_array[] = $item;
    }

    // generate cached menu
    if($cache && !$this->getCachedMenu()) $this->generateCache($menu_array);

    return $menu_array;

  }

  //-------------------------------------------------------- 
  //  Caching
  //-------------------------------------------------------- 

  /**
   *  Generate Menu Cache
   *  menu json file
   *  @param array $menu_array
   */
  public function generateCache($menu_array) {
    $suffix = wire("user")->language ? wire("user")->language->name : "default";
    $cache_folder = wire("config")->paths->assets . "cache/menu-manager/";
    if(!is_dir($cache_folder)) wire("files")->mkdir($cache_folder);
    $menu_json_file = "{$cache_folder}{$this->name}___$suffix.json";
    $menu_json = json_encode($menu_array);
    if(!file_exists($menu_json_file)) wire("files")->filePutContents($menu_json_file, $menu_json);
  }
  
  /**
   *  Get menu cached file
   *  return menu array or false
   *  @return array|bool
   */
  public function getCachedMenu() {
    $suffix = wire("user")->language ? wire("user")->language->name : "default";
    $cache_folder = wire("config")->paths->assets . "cache/menu-manager/";
    $menu_json_file = "{$cache_folder}{$this->name}___$suffix.json";
    if(!file_exists($menu_json_file)) return false;
    $menu_json_data = wire("files")->fileGetContents($menu_json_file);
    return json_decode($menu_json_data, true);
  }

  public function clearMenuCache() {
    $cache_folder = wire("config")->paths->assets . "cache/menu-manager/";
    $menu_json_file = "{$cache_folder}{$this->name}.json";
    if(file_exists($menu_json_file)) wire("files")->unlink($menu_json_file);
    $languages = wire("languages");
    if($languages && count($languages)) {
      foreach($languages as $lng) {
        $menu_json_file = "{$cache_folder}{$this->name}___{$lng->name}.json";
        if(file_exists($menu_json_file)) wire("files")->unlink($menu_json_file);
      }
    } else {
      $menu_json_file = "{$cache_folder}{$this->name}___default.json";
      if(file_exists($menu_json_file)) wire("files")->unlink($menu_json_file);
    }
  }


  //-------------------------------------------------------- 
  //  Menu Items
  //-------------------------------------------------------- 

  // Get shortcodes and turn them to href
  public function linkShortCodes($href) {
    foreach($this->shortcodes() as $key => $value) {
      $href = str_replace("$key", "$value", $href);
    }
    return $href;
  }

  public function targetPage($item) {
    if (($item->link_type->name == "page" || $item->link_type->name == "page-htmx") && $item->select_page != "") {
      return $item->select_page->id;
    } else {
      return null;
    }
  }

  public function href($item) {
    $href = "";
    $link_type = $item->link_type->name;
    $page_link = $item->select_page;
    $link = $item->link;
    $link_attr  = $item->link_attr;
    if(($link_type == "page" || $link_type == "page-htmx") && $page_link != "") {
      $href = $page_link->url;
    } elseif ($link_type == "external") {
      $href = $this->linkShortCodes($link);
    } else {
      $href = "#";
    }
    return $href;
  }

  public function attr($item) {
    $link_type = $item->link_type->name;
    $link_attr  = $item->link_attr;
    $attr = "";
    if($link_type == "external") {
      $attr .= ($link_attr[1]) ? " target='_blank'" : "";
      $attr .= ($link_attr[2]) ? " rel='nofollow'" : "";
    } elseif($link_type == "page-htmx") {
      $page_link = $item->select_page;
      $onclick = "wirekit.htmx('menu')";
      $attr .= " hx-get={$page_link->url}?htmx=1";
      $attr .= " hx-target='#main'";
      $attr .= " hx-swap='innerHTML'";
      $attr .= " hx-indicator='#htmx-page-indicator'";
      if($page_link != "") $attr .= " hx-push-url='{$page_link->url}'";
      if($onclick && $onclick != "") $attr .= " onclick=$onclick";
    } elseif ($link_type == "ajax") {
      $onclick = "wirekit.ajaxReq('$item->link')";
      $attr .= " onclick=$onclick";
    } elseif ($link_type == "htmx") {
      $htmx_url = wire("htmx")->url . $item->link;
      $attr .= " hx-get={$this->linkShortCodes($htmx_url)}";
      $attr .= " hx-target='#main'";
      $attr .= " hx-swap='innerHTML'";
    } elseif ($link_type == "modal-htmx" || $link_type == "offcanvas-htmx") {
      $onclick_modal = "wirekit.htmx('modal')";
      $onclick_offcanvas = "wirekit.htmx('offcanvas')";
      $htmx_url = wire("htmx")->url . $item->link;
      $attr .= " hx-get={$this->linkShortCodes($htmx_url)}";
      $attr .= " hx-target='body'";
      $attr .= " hx-swap='beforeend'";
      if($link_type == "modal-htmx") $attr .= " onclick=$onclick_modal";
      if($link_type == "offcanvas-htmx") $attr .= " onclick=$onclick_offcanvas";
    } elseif ($link_type == "uk-toggle") {
      $attr .= " uk-toggle";
    } elseif ($link_type == "uk-scroll") {
      $attr .= " uk-scroll";
    }
    return $attr;
  }

  public function homeAttr() {
    $attr = "";
    if(wire("modules")->get("MenuManager")->home_htmx == "1") {
      $home = wire("pages")->get("/");
      $onclick = "wirekit.htmx('menu')";
      $attr .= " hx-get={$home->url}?htmx=1";
      $attr .= " hx-target='#main'";
      $attr .= " hx-swap='innerHTML'";
      $attr .= " hx-push-url='{$home->url}'";
      $attr .= " hx-indicator='#htmx-page-indicator'";
      $attr .= " onclick=$onclick";
    }
    return $attr;
  }

  public function isParent($item) {
    return $item->submenu_type->name != "none" ? true : false;
  }

  public function isVisible($item) {
    $pageAccess = "";
    $pageAccess = wire("pages")->get("/");
    $link_type = $item->link_type->name;
    $page_link = $item->select_page;
    if($link_type == 'page' && $page_link != "") {
      $pageAccess = wire("pages")->get("id=$page_link");
    }
    return $pageAccess->viewable();
  }

}

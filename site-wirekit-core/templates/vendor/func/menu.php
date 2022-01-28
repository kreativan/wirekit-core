<?php namespace ProcessWire;
/**
 * Main Menu
 * get main menu array, or page if $items = false
 * @param bool $items
 * @return array|Page 
 */
function mainMenu($custom_items = []) {
  $menuManager = wire("modules")->get("MenuManager");
  $show_home = $menuManager->show_home == "1" ? "true" : "false";
  $options = [
    "show_home" => $show_home,
    "cache" => "true",
    "prefix" => "uk-",
  ];
  $id = $menuManager->main_menu_source;
  $menu = wire("pages")->get("id=$id");
  return $menu->items($options, $custom_items);
}

// Check if current menu item is active
function isMenuActive($item) {
  $page_id = wire("input")->get->page_id;
  $page = $page_id ? wire("pages")->get("id=$page_id") : wire("page");
  if(($page->id == $item["page_id"]) || ($page->rootParent->id == $item["page_id"])) {
    return true;
  } else {
    return false;
  }
}

// Get current menu item css class
function menuItemClass($item, $prefix = "uk-") { 
  $class = isset($item["is_subitem"]) && $item["is_subitem"] ? "submenu-item" : "menu-item";
  if(isMenuActive($item)) $class .= " {$prefix}active";
  if(isset($item["is_parent"]) && $item["is_parent"]) $class .= " {$prefix}parent";
  return $class;
}
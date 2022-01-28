<?php
/**
 *  MenuManager Info
 *  @author Ivan Milincic <kreativan.dev@gmail.com>
 *  @link http://www.kraetivan.dev
*/

$info = array(

	// Your module's title
	'title' => 'Menu Manager',

	// A 1 sentence description of what your module does
	'summary' => 'Manage website menus and navigation.',

	// Module version number: use 1 for 0.0.1 or 100 for 1.0.0, and so on
	'version' => 1,

	// Name of person who created this module (change to your name)
	'author' => 'Ivan Milincic',

	// Icon to accompany this module (optional), uses font-awesome icon names, minus the "fa-" part
	'icon' => 'bars',

	// URL to more info: change to your full modules.processwire.com URL (if available), or something else if you prefer
    'href' => 'http://modules.processwire.com/',

    // name of permission required of users to execute this Process (optional)
    'permission' => 'page-view',

    // permissions that you want automatically installed/uninstalled with this module (name => description)
    'permissions' => array(
      'menu-manager' => 'Access to menu manager'
    ),

	// page that you want created to execute this module
	'page' => array(
		'name' => 'menu-manager',
		'parent' => 'manage',
		'title' => 'Menu Manager'
    ),

    'singular' => true,
    'autoload' => false, // need for Redirect

	// for more options that you may specify here, see the file: /wire/core/Process.php
	// and the file: /wire/core/Module.php

);

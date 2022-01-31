# WIREKIT Core
Build lightning-fast and feature-rich websites with ProcessWire.

![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/kreativan/wirekit-core?include_prereleases&label=version)

* Website: <a href="https://www.wirekit.dev" target="_blank">wirekit.dev</a> (in plans)
* Demo: <a href="https://start.wirekit.dev/core/" target="_blank">start.wirekit.dev/core/</a> 
* Updates: <a href="https://github.com/kreativan/wirekit-updates" target="_blank">WireKit Updates Repo</a> 
* Docs: Coming soon...

WireKit is processwire site profile, it provides modules, layouts, helpers and basic structure as a starting point for building any kind of websites.    
Primary focus is on building front-end, rather then providing APIs. It is, i would say "html first".     

Some principals that wirekit try to follow:
* Plug and play features
* Reusable components (layouts).
* Keep workflow in templates folder
* HTML first! Use php in html not other way around.
* Separation of concerns.
* Easy to edit and customize markup.
* All front-end logic should be ajax based.

### Starters
WireKit should provide quick start for your projects, so idea is to have starters for different purposes and usecases. WireKit Core is the first minimal starter, and more will come. There is a WireKit PRO starter in works, the premium one, but more about that some other time. Starters with different front-end frameworks should also be expected, Boostrap Starter for example...

### Navigation
You can build your website navigation as traditional (page reload) way, or take advantage of SPA (single page app) type of navigation that wirekit provides out of the box. In both ways, we are keeping all of the SEO benifits that MPA (multi page apps), SSR (server side rendering), "traditional" websites provide.

### Menu Manager
WireKit comes with menu manager built in. It is based on processwire templates and pages, which gives us much flexibility... With custom admin UI, you can manage all site navigation and menus in one place.

### System and Site Settings
Site settings in wirekit are handled with system page and custom field that will generate settings fields from the json file. This way we can define site settings based on a project.     
Json file is located at `/vendor/json/system.json`. To change it, and add your own options, just copy `system.json` file to the `/templates/assets/json/` folder, and do your changes there. This way your settings will not be overwritten during the updates.        
`$system` is a global variable in wirekit, so you can access the system page via api from anywhere as `$system` in template files, `$this->system` in modules, and `wire("system")` from anywhere. To get the site settings use `$system->settings("field_name")`.

### _init.php
This file is automatically included in all template files. We are using it to include our functions and manage wirekit settings using `setting()` function. Along with settings, here you can add js and css files that will be loaded in `<head>`, add less files to the parser, define google font etc... 

### Style
WireKit provides less and scss compiler out of the box, so you can choose which preprocessor (if any) will be used on front-end. I would recommend using **less**, if there is a choice, as the compiler is more flexible at the moment.    

#### Less
If you are using less preprocessor, you can pass less files to the compiler from any folder. Not just files, but also variables...    
Less files and variables can be set in _init.php `setting()` function:
```
setting([
  "preprocessor" => "less", // less or scss

  ...

  // less files to compile
  "less_files" => [
    $config->paths->lib . "less/svg.less",
    $config->paths->lib . "less/htmx.less",
    $config->paths->templates . "less/style.less",
  ],

  /**
   *  Override Less variables...
   *  @example ["global-font-family" => $system->font_family]
   */
  "less_vars" => [
    "wk-font" => "Jost, Sans Serif",
    "wk-font-base" => "Jost, Sans Serif",
  ],

  ...

]);
```

If you want to use wirekit less compiler "manually", you can do so:
```
$less_files = [
  "my_file_1.less",
  "my_file_2.less",
];

$less_vars = [
  "wk-bg-prmary" => "blue",
];

// helper is global variable in wirekit
$helper->less($less_files, $less_vars, "output-file-name");
```

#### scss
When usign scss preprocessor, you need to create `style.scss` file in `/templates/scss/` folder, and it will be automatically picked up by the parser. All files and folders in `/templates/scss/` will be tracked for changes, so parser will run only if there is a change detected. There is nothing to define in _init.php `setting()` for the scss compiler, except to set the preprocessor option to scss:
```
setting([
  "preprocessor" => "scss", // less or scss
  ...
]);
```
If you want to use wirekit less compiler "manually", you can do so:
```
$helper->scss($folder, $file_name);
$helper->scss("{$config->paths->templates}scss/", "style.scss");
```

### head() and foot()
Each page needs to have header and footer, right!? As wirekit is using direct output method, we need to add them manually to each template file. To make it easier and more flexible, wirekit have `head()` and `foot()` functions for this purpose. Template file:
```
<?php namespace ProcessWire;
head(); 
?>

<!-- page content here -->

<?php foot(); ?>
```
This will be the output:
```
<html>
  <body>
    <header id="header"></header>
    <main id="main">
      <!-- page content here -->
    </main>
    <footer id="footer"></footer>
  </body>
</html>
```
In `head()` function we can add js and css files to be included in the `<head>`, but also we can specify/override meta tags for our pages.
```
<?php namespace ProcessWire;
head([
  "css" => "css_file_url.css",
  "js" => "js_file_url.js",
  "meta" => [...]
]); 
?>

<!-- page content here -->

<?php foot(); ?>
```

### Meta
WireKit has simple way of managing meta tags. You can define defaults in _init.php `setting()` function, but can also set meta tags individually for each page in `head()` function.
```
setting([
  ...

  /**
   *  Meta Tags
   *  Set default meta tags here
   */
  "meta" => [
    "title" => $page->title,
    "description" => $sanitizer->truncate($page->body, 150),
    "image" => !empty($page->img) ? $page->img->url : "",
    "generator" => "wirekit.dev",
  ],

  ...
]);
```
Override/set meta tags in template file:
```
head([
  "meta" => [
    "title" => !empty($page->headline) ? $page->headline : $page->title,
    "description" => $sanitizer->truncate($page->text, 150),
    "image" => !empty($page->cover) ? $page->cover->url : "",
  ]
]); 
```

### HTMX
HTMX (<a href="https://htmx.org/">htmx.org</a>) is the first class citizen in wirekit. It's used for SPA like navigation, rendering dynamic content etc... It's a very powerful tool, easy and real joy to use, it fits perfect into wirekit "html first" idea and workflow...       
Wirekit uses "layouts" as reusable components, and they are exposed at the htmx end-point by default on `/system/htmx/`. This way you can fetch any content, any time, anywhere using simple htmx request with any html element. 
Example:    
`hx-get="/system/htmx/layout/product/card/"`     
or     
`hx-get="<?= $htmx->url ?>layout/product/card/"`   
This will call for `/templates/layout/product/card.php` file. And this way we can for example lazy load product card using htmx...

### Ajax
All front-end logic in wirekit is imagined to be handled with ajax. Wirekit provides `/system/ajax/` end-point where you can send request and handle your logic. For example:    
Http request to `/system/ajax/contact/` will call for `/templates/ajax/contact.php` file. This way you can create unlimited number of end-points, some can be just json responses, some business logic, up to you...     
Up to two url segments are suported for now: `/ajax/file-name/` and `/ajax/folder/file-name/`.
Simple fetch request:     
```
<script>
fetch(`${cms.ajax}test/?id=123`)
  .then(response => response.json())
  .then(data => {
    console.log(data);
  })
</script>
``` 
In `/tempates/ajax/text.php`
```
<?php namespace ProcessWire

$response = [
  "status" => "success",
  "message" => "Ajax test is OK",
  "id" => $input->get->id
];

header('Content-type: application/json');
echo json_encode($response);

exit();
```

### WireKit UI

Wirekit UI is minimal css/less library used in WireKit Core by default. It is a work in progress, and im planing to work on it more in the future. It's mostly utility classes with flex and grid that can help you build quick layouts and prototypes. More about it will be avalable in official docs, for now if you are interested, take a look at `/vendor/lib/wkui-dev/` folder and <a href="https://start.wirekit.dev/core/wirekit/ui/">this example</a>

### What's next?

I will continue working on this project, and have many ideas for it, but no timeline and road map for now. Definitly first on the list is official wirekit website and documentation.

Here's some ideas:
* WireKit PRO
* UIkit Starter
* Boostrap Starter
* Customizer for UIkit, WireKit UI and/or other framworks. To manage colors/fonts/backgrounds/ etc... from the admin UI
* User management on front-end. Login, registration, user profile
* UI Library. One click install layouts, pages, structured content etc... 
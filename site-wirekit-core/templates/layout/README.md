*** You can delete this file ***

Here you can add your layout files.     
Layout files can also be accessed from the system page url: `/system/layout/*/**/`.
This way you can load any content dynamically using `htmx` or `response.text()`...

### HTMX & Data

Passing data to the layout files can be done using `hx-vals` or $_GET variables:

```
hx-get="/system/htmx/test/"
hx-vals='{"key": "value"}'
// or
hx-get="/system/htmx/test/?key=value"

// in htmx file use the data as:
echo $key;
```

### Some $_GET variables also provide additional data
* `?page_id=123 => $page` processwire page
* `?page_url=/my-page/ => $page` processwire page
* `?page_ref=item => $item` page reference, used in combination with other two

```
hx-vals='{"page_id": "123", "page_ref": "product"}'
// use:
echo $page->title;
// or page_ref
echo $product->title
```

Lazy load example:
```
// request
// this will be replaced when element enter viewport
<div 
  id="my-id"
  hx-get="/system/layout/home/about/"
  hx-trigger="revealed"
  hx-vals='{"headline": "About Us", "text": "lorem ipsum...", "img": "assets/images/my_image.jpg"}'
>
</div>

// layout file: /templates/layout/home/about.php
<div id="my-id">
  <h2><?= $headline ?></h2>
  <p><?= $text ?></p>
  <img src="<?= $img ?>" />
</div>
```

Example, product card:
```
// request card when this element enter viewport
<div hx-get="/system/layout/product/card/"
  hx-trigger="revealed"
  hx-vals='{"page_id": "1047", "page_ref": "product"}'
>
</div>

// layout file:/templates/layout/product/card.php
<div class="uk-card uk-card-defult">
  <div class="uk-card-media-top">
    <img src="<?= $product->img->url ?>" />
  </div>
  <div class="uk-card-body">
    <h3 class="uk-card-title"><?= $product->title ?></h3>
  </div>
</div>

```
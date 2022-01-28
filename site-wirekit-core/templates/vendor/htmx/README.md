*** You can delete this file ***

Here u can create files that will be executed on http request to the 
`/htmx/` url.
Eg: `{$htmx->url}test`
will call for `/htmx/test.php` file.

### Data

Passing data to htmx files, can be done with $_GET requests:

```
hx-get="<?= $htmx->url ?>test"
hx-vals='{"key": "value"}'
// or
hx-get="<?= $htmx->url ?>test/?key=value"

// in htmx file (/templates/htmx/test/), use the data as:
echo $key;

//  Some $_GET variables are used to provide additional data to the htmx files
//  page_id => $page - processwire page
//  page_url => $page - processwire page
//  page_ref => reference to the $page eg: $item

// page by id
hx-vals='{"page_id": "123"}'
// page by url
hx-vals='{"page_url": "/basic-page/"}'
// use in htmx file
echo $page->title

// page_ref
hx-vals='{"page_id": "123". "page_ref": "item"}'
echo $item->title 

```

Lazy load example:
```
<div 
  id="htmx-lazy-load-example"
  hx-get="<?= $htmx->url ?>test"
  hx-trigger="revealed"
  hx-vals='{"key": "value"}'
>
</div>
```
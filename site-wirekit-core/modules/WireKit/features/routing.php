<?php namespace ProcessWire; 
head([
  "meta_title" => "WireKit: Routing",
]); 
?>

<section class="uk-section">
  <div class="uk-container uk-container-small">

    <h1>Custom Routing</h1>
    <p>You can use url hooks in <b>init.php</b> or <b>ready.php</b>, or in autoload module...

    <h3>Return values</h3>
    <ul><li><strong>None:</strong> 404 response</li><li><strong>String:</strong> Output of string is sent</li><li><strong>Page:</strong> Returned Page is rendered and made the current $page API variable</li><li><strong>Array:</strong> Converted to JSON and output with "application/json" content-type header</li><li><strong>True:</strong> Boolean true indicates you are handling the URL and are outputting directly</li><li><strong>False:</strong> Boolean false is the same as None, which means a 404 response</li></ul>
    
    <h3>Render custom file</h3>
    <pre><code>
      $this->addHook('/dev/', function($event) {
        $this->files->include($this->config->paths->templates . "_dev.php");
        return true;
      }); 
    </code></pre>

    <h3>Render file based on argument</h3>
    <pre><code>
      $this->addHook('/ajax/{file_name}/?', function($event) {
        $file_name = $event->arguments(1);
        $this->files->include($this->config->paths->templates . "ajax/$file_name.php");
        return true;
      })
    </code></pre>

    <h3>Render page</h3>
    <pre><code>
      $this->addHook('/custom-routing/basic-page/', function($event) {
        return $event->pages->get('template=basic-page');
      });
    </code></pre>

    <h3>JSON data</h3>
    <p>Outputting JSON data about any page when the last part of the URL is "json"</p>
    <pre><code>
      $this->addHook('(/.*)/json', function($event) {
        $page = $event->pages->findOne($event->arguments(1));
        if&nbsp;($page->viewable()) {
          return [
            'id' => $page->id,
            'url' => $page->url,
            'title' => $page->title,
          ];
        }
      }); 
    </code></pre>

    <h3>Making short URLs of all blog posts</h3>
    <p>In this example blog post url will be: <b><?= $pages->get("/")->httpUrl ?>1234/</b>, where the <b>1234</b> is a blog post id.</p>
    <pre><code>
      $this->addHook('/([0-9]+)', function($event) {
        $id = $event->arguments(1);
        $post = $event->pages->findOne("template=blog-post, id=$id");
        if&nbsp;($post->viewable()) return $post;
      }); 
    </code></pre>

    <h3>Pagination</h3>
    <p>To use pagination, just add <code>{pageNum}</code> argument to the end of the url path. You can get the page number with <code>$event->pageNum</code></p>
    <pre><code>
      $this->addHook('/foo/bar/{pageNum}', function($event) {
        return "You are on page $event->pageNum";
      }); 
    </code></pre>

  </div>
</section>


<?php foot(); ?>
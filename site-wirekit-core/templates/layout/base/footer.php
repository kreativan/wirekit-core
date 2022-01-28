<?php namespace ProcessWire; ?>

<footer id="footer">

  <div class="wk-container wk-text-center">
  
    <div class="wk-border-top wk-padding wk-text-small">
      <p>Copyright © <?= date("Y") ?> <?= $system->settings("site_name") ?>. All Rights Reserved</p>
    </div>

  </div>

</footer>

<?php if(setting("htmx")) :?>
  <div id="htmx-page-indicator"></div>
<?php endif;?>
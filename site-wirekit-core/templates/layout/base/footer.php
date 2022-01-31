<?php namespace ProcessWire; ?>

<footer id="footer">

  <div class="w-container w-text-center">
  
    <div class="w-border-top w-padding w-text-small">
      <p>Copyright © <?= date("Y") ?> <?= $system->settings("site_name") ?>. All Rights Reserved</p>
    </div>

  </div>

</footer>

<?php if(setting("htmx")) :?>
  <div id="htmx-page-indicator"></div>
<?php endif;?>
<?php namespace ProcessWire; 
head([
  "meta_title" => "WireKit UI",
]); 
?>

<div class="wk-section">
<div class="wk-container">

<h1 class="wk-h1 wk-margin-remove-top">The quick brown fox jumps over the lazy dog</h1>
<p class="wk-text-small">Lorem ipsum dolor sit, amet consectetur adipisicing elit.</p>
<p class="wk-text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien velit, aliquet eget
  commodo nec, auctor a sapien. Nam eu neque vulputate diam rhoncus faucibus. Curabitur quis varius libero.</p>
<p>Lorem ipsum, dolor sit amet <strong>adipisicing</strong> adipisicing elit. <em>Magnam alias ipsum</em>, fugiat omnis
  ab <a href="#">voluptatum</a> sunt rerum dicta inventore expedita eligendi dignissimos! Animi <b>cumque tempore</b>
  quaerat saepe eum rerum quisquam.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien velit,
  aliquet eget commodo nec, auctor a sapien. Nam eu neque vulputate diam rhoncus faucibus. Curabitur quis varius libero.
</p>

<blockquote>
  Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta quaerat ratione consectetur, nemo expedita distinctio
  quasi sint magnam beatae quae qui reprehenderit itaque autem eos repellat nam tempora, error dolorum?
</blockquote>

<h3>Buttons</h3>

<div class="wk-margin">
  <a class="wk-btn wk-btn-default" href="#">Default</a>
  <a class="wk-btn wk-btn-primary" href="#">Primary</a>
</div>

<h3>Backgrounds</h3>

<div class="wk-grid wk-grid-3 wk-grid-2--md wk-grid-1--sm wk-margin">
  <div>
    <div class="wk-panel wk-padding wk-bg-primary">
      <p class="wk-margin-remove">Primary</p>
    </div>
  </div>
  <div>
    <div class="wk-panel wk-padding wk-bg-muted">
      <p class="wk-margin-remove">Muted</p>
    </div>
  </div>
  <div>
    <div class="wk-panel wk-padding wk-bg-dark">
      <p class="wk-margin-remove">Dark</p>
    </div>
  </div>
</div>
<div class="wk-bg-muted wk-padding">
  <div class="wk-panel wk-padding wk-bg-white">
    <p class="wk-margin-remove">White</p>
  </div>
</div>

<h3>Shadow</h3>

<div class="wk-panel wk-shadow wk-padding-l wk-margin-l wk-text-center">
  <span>Shadow</span>
</div>

<h3>Grid</h3>

<div class="wk-grid wk-grid-s wk-grid-4 wk-grid-2--md wk-grid-1--sm">
  <div class="wk-panel wk-padding wk-bg-muted">
    <span>1</span>
  </div>
  <div class="wk-panel wk-padding wk-bg-muted">
    <span>2</span>
  </div>
  <div class="wk-panel wk-padding wk-bg-muted">
    <span>3</span>
  </div>
  <div class="wk-panel wk-padding wk-bg-muted">
    <span>4</span>
  </div>
  <div class="wk-panel wk-padding wk-bg-muted">
    <span>5</span>
  </div>
  <div class="wk-panel wk-padding wk-bg-muted">
    <span>6</span>
  </div>
  <div class="wk-panel wk-padding wk-bg-muted">
    <span>7</span>
  </div>
  <div class="wk-panel wk-padding wk-bg-muted">
    <span>8</span>
  </div>
</div>

<h3>Grid Custom (40-60)</h3>

<div class="wk-grid wk-grid-collapse wk-grid-40-60 wk-grid-2--md wk-grid-1--sm">
  <div class="wk-panel wk-padding wk-bg-primary">
    <span>40</span>
  </div>
  <div class="wk-panel wk-padding wk-bg-dark">
    <span>60</span>
  </div>
</div>

<h3 class="wk-margin-remove-bottom">Flex + Width</h3>
<p class="wk-margin-top-s">(Screensize: large / medium / small)</p>
<div class="wk-flex wk-flex-wrap wk-text-center">
  <div class="wk-width-25 wk-width-50--md wk-width-100--sm">
    <div class="wk-panel wk-bg-muted wk-padding-s">
      25% / 50% / 100%
    </div>
  </div>
  <div class="wk-width-50 wk-width-100--sm">
    <div class="wk-panel wk-bg-dark wk-padding-s">
      50% / 50% / 100%
    </div>
  </div>
  <div class="wk-width-25 wk-width-100--md">
    <div class="wk-panel wk-bg-muted wk-padding-s">
      25% / 100% / 100%
    </div>
  </div>
</div>

<!-- 

<h3>Overlay</h3>

<?php
$image = "https://source.unsplash.com/random/440x300?nature";
?>

<div class="wk-grid wk-grid-3 wk-grid-2--md wk-grid-1--sm">
  <div class="wk-panel wk-bg-muted wk-height-m wk-overflow-hidden wk-overlay-container">
    <img class="wk-image wk-image-fit" src="<?= $image ?>" />
    <div class="wk-overlay wk-overlay-center">
      <div class="wk-overlay-content wk-light">
        <h3 class="wk-margin-remove">Overlay</h3>
      </div>
    </div>
  </div>
  <div class="wk-panel wk-bg-muted wk-height-m wk-overflow-hidden wk-overlay-container wk-image-hover-twist">
    <img class="wk-image wk-image-fit" src="<?= $image ?>" />
    <div class="wk-overlay wk-overlay-center wk-overlay-light">
      <div class="wk-overlay-content wk-light">
        <h3 class="wk-margin-remove">Overlay Light</h3>
      </div>
    </div>
  </div>
  <div class="wk-panel wk-bg-muted wk-height-m wk-overflow-hidden wk-overlay-container">
    <img class="wk-image wk-image-fit" src="<?= $image ?>" />
    <div class="wk-overlay wk-overlay-hover wk-overlay-center">
      <div class="wk-overlay-content wk-light">
        <h3 class="wk-margin-remove">Overlay Hover</h3>
      </div>
    </div>
  </div>
</div>

-->


</div><!-- container end -->
</div>
<?php 
foot();
?>
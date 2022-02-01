<?php namespace ProcessWire; 
head([
  "meta" => [
    "title" => "WireKit UI",
  ]
]); 
?>

<div class="w-section">
<div class="w-container">

<h1 class="w-h1 w-margin-remove-top">The quick brown fox jumps over the lazy dog</h1>
<p class="w-text-small">Lorem ipsum dolor sit, amet consectetur adipisicing elit.</p>
<p class="w-text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien velit, aliquet eget
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

<div class="w-margin">
  <a class="w-btn w-btn-default" href="#">Default</a>
  <a class="w-btn w-btn-primary" href="#">Primary</a>
</div>

<h3>Backgrounds</h3>

<div class="w-grid w-grid-3 w-grid-2--md w-grid-1--sm w-margin">
  <div>
    <div class="w-panel w-padding w-bg-primary">
      <p class="w-margin-remove">Primary</p>
    </div>
  </div>
  <div>
    <div class="w-panel w-padding w-bg-muted">
      <p class="w-margin-remove">Muted</p>
    </div>
  </div>
  <div>
    <div class="w-panel w-padding w-bg-dark">
      <p class="w-margin-remove">Dark</p>
    </div>
  </div>
</div>
<div class="w-bg-muted w-padding">
  <div class="w-panel w-padding w-bg-white">
    <p class="w-margin-remove">White</p>
  </div>
</div>

<h3>Shadow</h3>

<div class="w-panel w-shadow w-padding-l w-margin-l w-text-center">
  <span>Shadow</span>
</div>

<h3>Grid</h3>

<div class="w-grid w-grid-s w-grid-4 w-grid-2--md w-grid-1--sm">
  <div class="w-panel w-padding w-bg-muted">
    <span>1</span>
  </div>
  <div class="w-panel w-padding w-bg-muted">
    <span>2</span>
  </div>
  <div class="w-panel w-padding w-bg-muted">
    <span>3</span>
  </div>
  <div class="w-panel w-padding w-bg-muted">
    <span>4</span>
  </div>
  <div class="w-panel w-padding w-bg-muted">
    <span>5</span>
  </div>
  <div class="w-panel w-padding w-bg-muted">
    <span>6</span>
  </div>
  <div class="w-panel w-padding w-bg-muted">
    <span>7</span>
  </div>
  <div class="w-panel w-padding w-bg-muted">
    <span>8</span>
  </div>
</div>

<h3>Grid Custom (40-60)</h3>

<div class="w-grid w-grid-collapse w-grid-40-60 w-grid-2--md w-grid-1--sm">
  <div class="w-panel w-padding w-bg-primary">
    <span>40</span>
  </div>
  <div class="w-panel w-padding w-bg-dark">
    <span>60</span>
  </div>
</div>

<h3 class="w-margin-remove-bottom">Flex + Width</h3>
<p class="w-margin-top-s">(Screensize: large / medium / small)</p>
<div class="w-flex w-flex-wrap w-text-center">
  <div class="w-width-25 w-width-50--md w-width-100--sm">
    <div class="w-panel w-bg-muted w-padding-s">
      25% / 50% / 100%
    </div>
  </div>
  <div class="w-width-50 w-width-100--sm">
    <div class="w-panel w-bg-dark w-padding-s">
      50% / 50% / 100%
    </div>
  </div>
  <div class="w-width-25 w-width-100--md">
    <div class="w-panel w-bg-muted w-padding-s">
      25% / 100% / 100%
    </div>
  </div>
</div>

<!-- 

<h3>Overlay</h3>

<?php
$image = "https://source.unsplash.com/random/440x300?nature";
?>

<div class="w-grid w-grid-3 w-grid-2--md w-grid-1--sm">
  <div class="w-panel w-bg-muted w-height-m w-overflow-hidden w-overlay-container">
    <img class="w-image w-image-fit" src="<?= $image ?>" />
    <div class="w-overlay w-overlay-center">
      <div class="w-overlay-content w-light">
        <h3 class="w-margin-remove">Overlay</h3>
      </div>
    </div>
  </div>
  <div class="w-panel w-bg-muted w-height-m w-overflow-hidden w-overlay-container w-image-hover-twist">
    <img class="w-image w-image-fit" src="<?= $image ?>" />
    <div class="w-overlay w-overlay-center w-overlay-light">
      <div class="w-overlay-content w-light">
        <h3 class="w-margin-remove">Overlay Light</h3>
      </div>
    </div>
  </div>
  <div class="w-panel w-bg-muted w-height-m w-overflow-hidden w-overlay-container">
    <img class="w-image w-image-fit" src="<?= $image ?>" />
    <div class="w-overlay w-overlay-hover w-overlay-center">
      <div class="w-overlay-content w-light">
        <h3 class="w-margin-remove">Overlay Hover</h3>
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
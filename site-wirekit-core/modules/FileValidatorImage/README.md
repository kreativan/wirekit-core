# Image File Validator

This module implements ProcessWire’s FileValidator interface, which is used by
`$sanitizer->validateFile()` as part of ProcessWire’s built-in file validations. 
This is used by existing file uploads in InputfieldFile and InputfieldImage, for 
example. This module adds support for validation of common image bitmap formats,
currently JPG, PNG, GIF. 

Developed by Ryan Cramer for ProcessWire 3.x   
License: MPL 2.0

## Validations

This module performs the following validations on image files:

- Extension must be one of: jpg, jpeg, gif, png.
- Image type must match PHP’s `IMAGETYPE_*` constant for GIF, PNG or JPEG.
- Image type must be consistent with that specified by file extension.
- MIME type must be consistent with that specified by file extension.   
- MIME type must be valid, any one of the following:
  - image/gif
  - image/png
  - image/jpeg
  - image/pjpeg
  - image/x-png
- EXIF data must not contain specific PHP or Javascript malware.
- Image must be greater than 1x1 in dimension. 
- Image must be greater than specified minWidth/minHeight dimensions.
- Image must be less than specified maxWidth/maxHeight dimensions. 
- Image must be openable from GD’s image functions in PHP without error. 
- Image must pass any custom validations assigned via hooks to an
  `isValidHook()` method (optional, applies only if method hooked).   

## Install

1. Copy files to /site/modules/FileValidatorImage/
2. In the PW admin, go to Modules > Refresh. 
3. Go to Modules > Site, and click Install for this module. 

## Usage

### Automatic usage

Because this module type (FileValidator) is already recognized by ProcessWire 3.x,
it is automatically used by uploads that occur through InputfieldImage and 
InputfieldFile.

### API usage

You can also use it from ProcessWire’s `$sanitizer` API variable:
~~~~~
$valid = $sanitizer->validateFile('/path/to/file.jpg');

if($valid) {
  // valid image file
} else {
  // not valid image file
  $reason = $sanitizer->errors('last string clear');
  echo "Image not valid because: $reason";
}
~~~~~
…or you can use this module directly. This is useful if you want to take advantage
of the min/max width and height settings: 
~~~~~
$validator = $modules->get('FileValidatorImage');
$validator->minWidth = 400;
$validator->minHeight = 250;
$validator->maxWidth = 1920;
$validator->maxHeight = 1080;

if($validator->isValid('/path/to/file.jpg')) {
  // image is valid
} else {
  $reason = $validator->getReason();
  "Image not valid because: $reason";
}
~~~~~

------
Copyright 2019 by Ryan Cramer Design, LLC

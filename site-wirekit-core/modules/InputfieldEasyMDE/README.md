# Inputfield EasyMDE

EasyMDE (Easy Markdown Editor) as an inputfield for ProcessWire.

EasyMDE is a Markdown editor with some nice features, allowing users who may be less experienced with Markdown to use familiar toolbar buttons and shortcuts. More information is at the [EasyMDE website](https://easymde.tk/).

![easy-mde](https://user-images.githubusercontent.com/1538852/102450675-d904a180-409b-11eb-9651-7ed900a1f1c1.gif)

## Installation

[Install](http://modules.processwire.com/install-uninstall/) the Inputfield EasyMDE module.

## Usage

Create a new textarea field, and in the "Inputfield Type" dropdown choose "EasyMDE". Save the field and if you like you can then configure the EasyMDE options for the field as described below.

To convert Markdown to HTML you can install the core TextformatterMarkdownExtra module and apply the textformatter to the field. Alternatively you can use `$sanitizer->entitiesMarkdown()` on the field value, e.g.

```php
echo $sanitizer->entitiesMarkdown($page->your_field_name, ['fullMarkdown' => true]);
```

## Configuration

On the "Input" tab of the field settings you can define EasyMDE options for the field in JSON format. Refer to the [EasyMDE documentation](https://github.com/Ionaru/easy-markdown-editor#configuration) for the available options. Keys in the JSON must be surrounded with double quotes.

Example:
```
"toolbar": ["bold", "italic", "heading", "|", "side-by-side"],  
"sideBySideFullscreen": false
```

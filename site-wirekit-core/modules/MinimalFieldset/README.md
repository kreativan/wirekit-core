# Minimal Fieldset

A module for ProcessWire CMS/CMF. Adds a config option to Fieldset/FieldsetGroup/FieldsetPage to render the fieldset without label or padding in Page Edit. When a neighbouring field in the same row is taller than the fieldset the extra height is distributed evenly among rows within the fieldset.

Requires ProcessWire v3 and AdminThemeUikit.

## Why?

This module allows you to create layouts in Page Edit that would not be possible without it. It's useful when you want a layout that has two or more fields as rows that are themselves within a row in Page Edit.

It's also useful when you have some fields that you want to add to a template as a group (i.e. via FieldsetGroup or FieldsetPage) but having a heading and visible wrapper for the fieldset in Page Edit would be redundant.

Example:

![template-fields](https://user-images.githubusercontent.com/1538852/48028668-fb375000-e1b0-11e8-99bc-da05652c3754.png)

![page-edit](https://user-images.githubusercontent.com/1538852/48028670-fbcfe680-e1b0-11e8-8805-648a4f405ad0.gif)

## Installation

[Install](http://modules.processwire.com/install-uninstall/) the Minimal Fieldset module.

## Usage

In the field settings for any Fieldset/FieldsetGroup/FieldsetPage, tick the "Remove label and padding for this fieldset" checkbox.

You can optionally disable the distribution of vertical space within the fieldset if you like.

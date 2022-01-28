# Admin Custom Pages Module for ProcessWire

### Create custom admin pages easily without having to build a Process Module.
 
The new version of this module works only with ProcessWire 2.4 and higher.
Differences are explained bellow.

Since version 1.1.0 the installation process automatically adds a custom Fieldtype to the admin template. This creates a select field where you can choose the template file to render. This functionality was added by [Nico](http://nico.is)

### To prepare the module:

1. Place the module folder in /site/modules/
2. Install the module in the modules page from the admin

### To create the pages:

1. Create a new page under "Admin" and give it the "admin" template. As "process" you have to choose "ProcessAdminCustomPages".
2. A field called "Template file" will appear. Select the file you want (we recommend that the file name starts with underscore "\_" so it doesn't appear in new template sugestions, ex: "\_custom.php").
3. That's all.

### To add custom script and style files to the page:

1. Add the "ACP_scripts_and_styles" to the page template (the field that was created automaticaly on instalation)
2. Add the .js and .css URLs in this field textarea, one in each line. can be absolute or relative (relative is assumed from the site root on eg: site/templates/styles/my.css)

--

### Troubleshooting:

> This page has no Process assigned.

You probably forgot to choose "ProcessCustomPages" as Process. (See step 1)


--

Module home: http://modules.processwire.com/modules/process-admin-custom-pages/

Support forum: http://processwire.com/talk/topic/3474-admin-custom-pages-module/

--

That's it! Hope you enjoy the module ;)

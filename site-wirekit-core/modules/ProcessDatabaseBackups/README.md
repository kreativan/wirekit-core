## Manage database backups for ProcessWire

[Read this blog post about this module](https://processwire.com/blog/posts/august-2014-core-updates-4/#database-backups-module)

This tool provides an admin interface for the following database backup functions: 

- Creating new backups
- Uploading backups
- Restoring backups
- Providing info on existing backups
- Managing existing backups (downloading, deleting, etc.)

This is meant to be used as a secondary backup tool, not a primary one. It uses
ProcessWire 3.x WireDatabaseBackups class to perform backups and restores. If 
you are working with really large files, it may be better to perform that task
directly in PhpMyAdmin or the native MySQL client. 

Requires ProcessWire 3.0.62 or newer.

License: MPL 2.0

Copyright 2021 by Ryan Cramer


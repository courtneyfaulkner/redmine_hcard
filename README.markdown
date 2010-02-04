# Redmine hCard Macro

This is a plugin for Redmine that adds a `{{hcard(username)}}` macro to show user contact details in [hCard microformat](http://microformats.org/wiki/hcard). This plugin does not require any changes to the Redmine data model. Redmine version 0.8.x and 0.9.x are known to work with the plugin. 

Currently, the macro is hard-coded to support the built-in first name, last name and email fields, as well as the following custom fields:

* title
* organization
* schedule
* office
* mobile
* aim
* yim
* msn
* gtalk

# Planned Improvements

* Restrict rendering the hcard.css into the header to one time
* Move to using locale strings rather than hard-coding the text
* Support user groups

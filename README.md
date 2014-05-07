###Preface: Redmine 1.x

If you're still using redmine 1.x, please upgrade. Redmine 1.x is out of support since a **very** long time, it's a security risk and you must not use it anymore. No support for redmine 1.x will be given at any time. Don't bother writing emails or opening issues, they won't be answered anyway.

Agile Dwarf
===========

This plugin was originally developed by [iRessources](http://www.iressources.com/) (at least it seems so).  
I forked it to correct minor annoyances, contributions and pull requests are welcome.

INSTALLATION
------------

Read the plugin installation guide on redmine.org: http://www.redmine.org/projects/redmine/wiki/Plugins  
If you're already somewhat familiar with installing redmine plugins, read on.

###QUICK INSTALLATION INSTRUCTIONS FOR THE IMPATIENT

####Using ZIP-file

* [Download the installation file from my repo](https://github.com/jniggemann/agile_dwarf/archive/master.zip)
* unzip it into ```#{RAILS_ROOT}/plugins```
* rename the extracted folder to 'agile_dwarf'
* in ```#{RAILS_ROOT}``` run the command ```rake redmine:plugins:migrate```
* restart redmine

####Using git

* ```git clone https://github.com/jniggemann/agile_dwarf.git``` into plugin folder
* ```rake redmine:plugins:migrate```
* restart redmine

## CONFIGURATION

Plugin settings are available via Administration -> Plugins -> Agile Dwarf plugin -> Configure  
To enable / disable, go to <project> -> Settings -> Modules -> Agile Dwarf

ABOUT AGILE DWARF
-----------------

Agile Dwarf plugin implements the agile method based on pre-estimating every task in hours (as opposed to in points). 

It adds 3 new tabs to your Redmine:

### Sprints

'Sprints' is intended for strategical planning or long-term management of backlog and sprints:
* Quick backlog issues creation
* Flexible sprints management
* Drag & Drop support for items between backlog and sprints
* Short sprint and backlog stats
* Detailed sprint stats
* Creating/Managing/Updating sprints
* Prioritising stories/issues

### Tasks

'Tasks' is for day-by-day use, every member of the team can manage his tasks quickly and efficiently:
* Current tasks for every member grouped by status (New, In Progress, Resolved)
* Drag & Drop support for tasks in status groups
* Quick time and progress tracking
* Configure agile_dwarf to use your workflow by setting the number of columns that should be displayed in the task board

### Run Charts

'Run charts' is an instant overview of current project status:
* One chart displays remaining and spent time at any point of the project lifecycle
* You can easily switch the chart time scope (the whole projects or any given sprint) and team scope (the whole team or any member)

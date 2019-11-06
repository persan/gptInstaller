# Description
gpt-installer is helper to build GPS-project templates allong with an installer.
The intent is to be able to construct a good project that 
easily could be installed as a gps-project-template with all bells and wistelse.


This project will install the installer along with a GPS-integration as
well as the TemplateTemplate project.

The tool read a .gpt-file and extract all the variables it then copies all files not listed in
the ```.gptignore``` file to the target folder while translatig all variables in filenames and files to the" @_name_@" form in order to be usefull for the gnatstudio templatesystem,
the copy operation will also remove all lines containing the string ```@gpt```.

# How to install
```
$make setup
$sudo make install
```

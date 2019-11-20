###############################################################################
# Script to be loaded every time the project project_name is
# loaded into gnat programming studio.
# No work shalll be done during load of the project
#  all setup and configuration shall be done in initialize_project_plugin().
###############################################################################


import GPS

NAME = "Project_Name"


def initialize_project_plugin():
    """
    Do all work here.
    """
    GPS.Console().write("%s ->  initialize_project_plugin()\n" % NAME)


GPS.Console().write("%s Loading\n" % NAME)

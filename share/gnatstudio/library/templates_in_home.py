import GPS
from gps_utils import hook
from os.path import *
templates = join(GPS.get_home_dir() , "templates")
if exists(templates):
    print ("Using templates:'%s'" % templates)
    GPS.ProjectTemplate.add_templates_dir(GPS.File(templates))

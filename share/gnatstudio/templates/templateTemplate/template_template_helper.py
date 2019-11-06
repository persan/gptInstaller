import GPS
import os
from os.path import *

class Project_Template_Project:

    def __init__(self):
        pass

    def get_pages(self, assistant):
        return 0

    def on_apply(self):
        for src in glob.glob("*.in"):
            tgt=basename(src)
            os.rename(src,tgt)

def get_object():
    return Project_Template_Project()

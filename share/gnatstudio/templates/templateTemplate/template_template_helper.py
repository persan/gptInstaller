import GPS
import os
from os.path import *
import glob
class Project_Template_Project:

    def __init__(self):
        pass

    def get_pages(self, assistant):
        return 0

    def on_apply(self):
        for src in glob.glob("*.gpt-in"):
            print (src)
            with open(src) as inf:
                buffer=inf.read()
            with open(src,"w") as outf:
                outf.write(buffer.replace("##","@"))
            tgt=splitext(src)[0] + ".gpt"
            os.rename(src,tgt)
        GPS.Project.recompute()

def get_object():
    return Project_Template_Project()

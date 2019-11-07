import os
from os.path import *
import re
import sys
import imp
import compiler
def import_module(filename):
    with open(filename, 'r') as file:
        mymodule = compiler.compile(file.read(),filename,'exec')
    return mymodule

def _find(filename):
    path=abspath(".")
    while len(path) > 3:
        _path=join(path, filename)
        if exists(_path):
            ext=import_module(_path)
            return import_module(_path)
        path=dirname(path)
d=_find("gptinstaller.config.py")
print d
print dir(d)

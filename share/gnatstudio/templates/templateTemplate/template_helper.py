#!/usr/bin/env python
import subprocess
import GPS
import sys


class Project_Template_Project:
    def __init__(self):
        pass

    def get_pages(self, assistant):
        return 0

    def on_apply(self):
        GPS.Console().write(subprocess.check_output(["git", "init", "."]))
        GPS.Console().write(subprocess.check_output(["git", "add",  "."]))
        GPS.Console().write(subprocess.check_output(["git", "commit", "-mInitial commit in project creation."]))


def get_object():
    return Project_Template_Project()

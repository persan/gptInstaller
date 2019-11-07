#!/usr/bin/env python
import subprocess
import GPS
import sys


class Project_Template_Project:
    GIT_COMMIT = ["git", "commit", "-mInitial commit in project creation."]
    GIT_ADD = ["git", "add",  "."]
    GIT_INIT = ss["git", "init"]

    def __init__(self):
        pass

    def get_pages(self, assistant):
        return 0

    def on_apply(self):
        GPS.Console().write(subprocess.check_output(GIT_INIT))
        GPS.Console().write(subprocess.check_output(GIT_ADD))
        GPS.Console().write(subprocess.check_output(GIT_COMMIT))
        GPS.Project.recompute()


def get_object():
    return Project_Template_Project()

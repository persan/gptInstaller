import subprocess
import GPS
import sys

from gs_utils.console_process import ANSI_Console_Process


class Project_Template_Project:

    INIT = ["git", "init",   "."]
    ADD = ["git", "add",   "."]
    COMMIT = ["git", "commit", "-mInitial commit in project creation."]

    def __init__(self):
        pass
        # self.assistant = None

    def get_pages(self, assistant):
        self.write("get_pages()\n")
        self.assistant = assistant
        self.write(str(assistant) + "\n")
        return 0

    def on_apply(self):
        try:
            # Initialize the project as a git project
            #
            ANSI_Console_Process(command=INIT, force=False)
            ANSI_Console_Process(command=ADD, force=False)
            ANSI_Console_Process(command=COMMIT, force=False)
            GPS.Project.recompute()
        except:
            print("Unexpected error:", sys.exc_info()[0])


def get_object():
    return Project_Template_Project()

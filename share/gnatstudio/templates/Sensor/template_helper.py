import subprocess
import GPS
import sys

print("1")

class Project_Template_Project:

    def __init__(self):
        print("2")
        # self.assistant = None

    def get_pages(self, assistant):
        self.write("get_pages()\n")
        self.assistant = assistant
        self.write(str(assistant) + "\n")
        return 0

    def write(self, item):

        GPS.Console().write('"%s"' % item)

    def on_apply(self):
        try:
            # Initialize the project as a git project
            #
            self.write(str(self) + "\n")
            self.write(str(dir(self)) + "\n")
            self.write(subprocess.check_output(["git", "init", "."]))
            self.write(subprocess.check_output
                       (["git", "add",  "."]))
            self.write(subprocess.check_output
                       (["git", "commit",
                         "-mInitial commit in project creation."]))

            GPS.Project.recompute()
        except:
            print("Unexpected error:", sys.exc_info()[0])


    def get_object():
        return Project_Template_Project()


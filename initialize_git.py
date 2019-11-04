#!/usr/bin/env python
import subprocess
subprocess.call(["git", "init", "."])
subprocess.call(["git", "add",  "."])
subprocess.call(["git", "commit", "-mInitial commit in project creation."])
print("----------------")

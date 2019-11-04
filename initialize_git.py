#!/usr/bin/env python
import subprocess
print(subprocess.call(["git", "init", "."]))
print(subprocess.call(["git", "add",  "."]))
print(subprocess.call(["git", "commit", "-mInitial commit in project creation."]))
print("----------------")

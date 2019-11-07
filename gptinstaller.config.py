import os
from os.path import *
class Config:
    def __init__(self):
         import os
         self.HOME=os.getenv("HOME")
    def getTargetFolder(self):
        return join(self.HOME,".gnatstudio","templates")
def get_config():
    return Config()

#!/usr/bin/env python
import os
from os.path import *
import re
import fnmatch

def import_module(filename):
    with open(filename, 'r') as file:
        file_contents = file.read()
    module_object = exec(file_contents)
    return module_object
    
class GprInstallerConfig:    
    def __init__(self, sourcefolder):
        self.target = None
        # default 
        self.ext=None
        self.loadexternal()
        HOME = os.getenv("HOME")
        if HOME:
            HOME = join(HOME, ".gnatstudio", "templates")
            if exists(HOME):
                self.target = HOME

        temp = join(sourcefolder, "..", "..", "templates")
        if exists(temp):
            self.target = abspath(temp)
        if not self.target:
            self.target = HOME
        try:
            import GPS            
        except:
            pass
    def loadexternal(self):
        path=abspath(self.sourcefolder)
        while len(path) > 3:
            _path=join(path,"gptinstaller.config.py")
            if exists(_path):
                self.ext=import_module(_path)
                return
             path=dirname(path)
                
    def calculatetargetfolder(self):
        if self.ext:
            print ("using external conf")
            return self.ext.get_config().getTargetFolder()
        olddir = "<N/A>"
        sourcefolder = self.sourcefolder
        while sourcefolder != olddir:
            olddir = sourcefolder
            name, ext = splitext(basename(sourcefolder))
            print (sourcefolder, name, ext)
            if ext == ".src" and exists(join(dirname(sourcefolder), name)):
                return join(dirname(sourcefolder), 
                            name, 
                            basename(self.sourcefolder))
            sourcefolder = dirname(sourcefolder)
        return "-"

        
class GptInstaller:
    def __init__(self, gptfile, targetfolder=None):
        self.names = []
        self.ignores = [".gptignore"]        
        self.gptFile = gptfile
        self.getnames()
        self.target = None
        self.sourcefolder = dirname(abspath(gptfile))
        with open(gptfile) as inf:
            for line in inf:
                m = re.match(".*?@gpt-target\s+(\S+)", line)
                if m:
                    self.target = m.group(1)
        if not self.target:
            raise Exception()
        self.config = GprInstallerConfig(self.sourcefolder)
        if exists(join(self.sourcefolder, ".gptignore")):
            self.readIgnores(join(self.sourcefolder, ".gptignore"))
        
        if targetfolder:
            self.targetfolder = targetfolder
        else:
            self.targetfolder = self.config.target
            
    def readIgnores(self, path):
        with open(path) as inf:
            for line in inf:
                line = line.strip()
                if len(line) > 0 and line[0] not in "#":
                    self.ignores.append(line)
                    
    def appendname(self, name):
        if name not in self.names:
            self.names.append(name)
            
    def getnames(self):        
        with open(self.gptFile) as inf:
            for line in inf:
                line = re.match("^(.+?):.+?:.*", line)
                if line:
                    name = (line.group(1).strip())                
                    self.appendname(name)
                    self.appendname(name.lower())
                    self.appendname(name.upper())

    def __str__(self):
        return "Names => [" + (",".join(self.names)) + "]\n" + \
               "Source_Folder => " + self.sourcefolder + "\n" +\
               "Target_Folder => " + self.targetfolder 
               
    def format(self, s):
        for name in self.names:
            s = s.replace(name, "@_%s_@" % name)
        return s
    
    def mkdir(self, d):
        d = join(self.targetfolder, self.target,
                 d[len(self.sourcefolder)+1:])
        if "/.git" in d:
            return
        if not exists(d) and ("(" not in d):
            os.makedirs(d)
            print ("mkdir %s" % d)
        
    def cp(self, f):
        if "/.git/" in f:
            return
        tgt = join(self.targetfolder, self.target,
                   self.format(f[len(self.sourcefolder)+1:]))
        print ("cp  %s -> %s" % (f, tgt))
        buffer = []
        with open(f) as inf:
            for line in inf:
                line = line.strip("\n")
                if "@gpt" not in line:
                    buffer.append(line)      
        with open(tgt, "w") as outf:
            name, ext = splitext(tgt)
            if ext == ".gpt":
                outf.write("\n".join(buffer))
            else:                    
                outf.write(self.format("\n".join(buffer)))
        
    def fnok(self, name):
        if os.path.islink(name):
            return False
        for ignore in self.ignores:
            if fnmatch.fnmatch(name, ignore):
                return False
        return True
    
    def install(self):
        for root, dirs, files in os.walk(self.sourcefolder):
            for d in dirs:
                if self.fnok(d):
                    self.mkdir(join(root, d))
            for f in files:
                if self.fnok(f):
                    self.cp(join(root, f))


def main(argv):
    if len(argv) > 1:
        for i in argv[1:]:
            if isfile(i):
                name, ext = splitext(i)
                if ext == ".gpt":
                    GptInstaller(i).install()
            elif isdir(i):
                for name in glob.glob(join(i, "*.gpt")):
                    GptInstaller(name).install()
    else:
        for name in glob.glob(join(i, "*.gpt")):
            GptInstaller(name).install()


if __name__ == "__main__":
    main(sys.argv)

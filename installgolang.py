#!/usr/bin/env python

import subprocess
import sys

user = subprocess.Popen(["whoami"], stdout=subprocess.PIPE)
out = user.communicate()
print out
print type(out)
if 'root' in out[0]:
    print "Install golang language"
    installgolang = subprocess.Popen(["apt-get", "install", "golang-go", "-y"], stderr=subprocess.PIPE)
    err = installgolang.communicate()
    if err is not None:
        print err


    print "Install bzr language"
    installbzr = subprocess.Popen(["apt-get", "install", "bzr", "-y"], stderr=subprocess.PIPE)
    err = installbzr.communicate()
    if err is not None:
        print err

    print "Go and get the necessary libraries BITCH!!"
    gogetfsnotify = subprocess.Popen(["go","get","github.com/howeyc/fsnotify"], stderr = subprocess.PIPE)
    err = gogetfsnotify.communicate()
    if err is not None:
        print err

    gogetBF = subprocess.Popen(["go","get","github.com/russross/blackfriday"], stderr = subprocess.PIPE)
    err = gogetBF.communicate()
    if err is not None:
        print err

    gogetyaml2 = subprocess.Popen(["go","get","github.com/wendal/goyaml2"], stderr = subprocess.PIPE)
    err = gogetyaml2.communicate()
    if err is not None:
        print err

    gogetaws = subprocess.Popen(["go","get","launchpad.net/goamz/aws"], stderr = subprocess.PIPE)
    err = gogetaws.communicate()
    if err is not None:
        print err

    gogets3 = subprocess.Popen(["go","get","launchpad.net/goamz/s3"], stderr = subprocess.PIPE)
    err = gogets3.communicate()
    if err is not None:
        print err

    gogetyaml = subprocess.Popen(["go","get","launchpad.net/goyaml"], stderr = subprocess.PIPE)
    err = gogetyaml.communicate()
    if err is not None:
        print err

else:
    print "You have to be root babe!"

sys.exit()

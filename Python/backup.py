#!/Library/Frameworks/Python.framework/Versions/2.6/bin/python
# encoding: utf-8
import os
import time
targetdir = '/usr/local/lib/'
source = open('/Users/gary/Desktop/compressMoreFiles.txt')
for line in source:
    zip_command = "zip -qr '%s.MoreFiles' %s" % (targetdir, line)
    if os.system(zip_command) == 0:
        print 'Successful backup to', targetdir
    else:
        print 'Backup FAILED'
    os.system("rm %s" % line)
source.close()



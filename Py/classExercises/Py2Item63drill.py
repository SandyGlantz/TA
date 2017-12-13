# -*- coding: utf-8 -*-
#!/usr/bin/python

# Item 63 Drill 
# Python2.7.14 -- SQLite3 -- TCLTK 8.5.18 -- macOS 10.12.6 (Sierra) -- Darwin
# Glantz, 26oct2017

# Python Drill: PyDrill_Datetime_27_idle
# Drill: Move files between folder, show file paths
#  NOTE:  __file__ does not work on Macs.


import shutil
import os


FolderA = ('/Users/sandy/Desktop/FolderA/')
FolderB = ('/Users/sandy/Desktop/FolderB/')

print ('The following files are in FolderA, located at: ')
print FolderA
##print os.path.realpath(FolderA)    # does same thing as above line
print os.listdir('/Users/sandy/Desktop/FolderA')
print '  '

print ('The following files are in FolderB, located at: ')
print FolderB
print os.listdir('/Users/sandy/Desktop/FolderB')
print '  '
print ('Note: Mac OS folders contain meta data which sometimes output as ".DS_Store" files.')
print '  '
print ("We will now move the files from FolderA to FolderB")
print '  '
print " ... working on it ... moving the files ..."
print '  '

shutil.move('FolderA/File1.txt', 'FolderB')
shutil.move('FolderA/File2.txt', 'FolderB')
shutil.move('FolderA/File3.txt', 'FolderB')
shutil.move('FolderA/File4.txt', 'FolderB')

print("Success!! - The folders have been moved.")
print '  '
print ('Now, the following files are in FolderA, located at: ')
print FolderA
##print os.path.realpath(FolderA)    # does same thing as above line
print os.listdir('/Users/sandy/Desktop/FolderA')
print '  '

print ('And the following files are in FolderB, located at: ')
print FolderB
print os.listdir('/Users/sandy/Desktop/FolderB')
print '  '
print ('Note: Mac OS folders contain meta data which sometimes output as ".DS_Store" files.')



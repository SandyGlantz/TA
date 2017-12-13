# -*- coding: utf-8 -*-
#!/usr/bin/python

# Item 63 Drill v.2
# Python2.7.14 -- SQLite3 -- TCLTK 8.5.18 -- macOS 10.12.6 (Sierra) -- Darwin
# Glantz, 26oct2017

# Python Drill: PyDrill_Datetime_27_idle
# Drill: Move .txt files between folders, show file paths


import os, shutil


path=os.getcwd()
source=os.listdir(path)
destination = os.path.join(path,"/Users/sandy/Desktop/FolderB/")

print("This is the current location of the text files to be moved: ")
for file in os.listdir("/Users/sandy/Desktop/FolderA/"):
    if file.endswith(".txt"):
        print(os.path.join("/Users/sandy/Desktop/FolderA/", file))
    
for files in source:
    if files.endswith(".txt"):
        shutil.move(files,destination)
        
print("  ")
print("This is the new location of the moved text files: ")
for file in os.listdir("/Users/sandy/Desktop/FolderB/"):
    if file.endswith(".txt"):
        print(os.path.join("/Users/sandy/Desktop/FolderB/", file))







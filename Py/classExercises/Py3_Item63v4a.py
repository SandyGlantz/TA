# -*- coding: utf-8 -*-
#!/usr/bin/python

# Item 63 Drill v.4a
# Python2.7.14 -- TCLTK 8.5.18 -- macOS 10.12.6 (Sierra) -- darwin
# Glantz, 31oct2017


import os, shutil
print("version 4a\n")


source = '/Users/sandy/Desktop/FolderA/'
destination = '/Users/sandy/Desktop/FolderB/'
listfile= os.listdir(source)

print("This is each filepath of the text files to be moved: ")
for files in listfile:
    if files.endswith(".txt"):
        print(os.path.join(source, files))
        SourceFile=os.path.join(source,files)
        shutil.move(SourceFile,destination)

print("\nThis is each filepath of the moved text files: ")   
for files in listfile:
    if files.endswith(".txt"):
        print(os.path.join(destination, files))

#15 lines of code
# not efficient with two for loops
# does meet 100% of assignment criteria:
# (print out each filepath - before and after - that was moved
# runs as a script on it's own - not a component

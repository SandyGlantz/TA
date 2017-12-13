# -*- coding: utf-8 -*-
#!/usr/bin/python

# Item 63 Drill v.4b
# Python2.7.14 -- TCLTK 8.5.18 -- macOS 10.12.6 (Sierra) -- darwin
# Glantz, 31oct2017


import os, shutil
print("version 4b\n")

def main():
    source = '/Users/sandy/Desktop/FolderA/'
    destination = '/Users/sandy/Desktop/FolderB/'
    pyItem63func(source,destination)

def pyItem63func(source,destination):
    listfile= os.listdir(source)
    print("These are the filepaths of the text files to be moved:")

    for files in listfile:
        if files.endswith(".txt"):
            print(os.path.join(source, files))
            sourceFile=os.path.join(source,files)
            shutil.move(sourceFile,destination)

    print("\nThis is the folder filepath of the moved text files: \n" + destination)

if __name__=='__main__':
    main()

# 17 lines of code
# efficient with only one for loop
# does NOT meet 100% of assignment criteria:
#      (print out each filepath - before and after - that was moved
# this version could be used with other scripts as a module

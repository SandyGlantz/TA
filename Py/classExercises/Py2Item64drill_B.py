# -*- coding: utf-8 -*-
#!/usr/bin/python

# Item 64 Drill version: B
# Python2.7.14 -- TCLTK 8.5.18 -- macOS 10.12.6 (Sierra)/darwin
# Glantz, 02Nov017
# Drill: Daily new or modified file transfer (copied, not moved)


import shutil, os, time


def main():
    source = '/Users/sandy/Desktop/FolderA/'
    destination = '/Users/sandy/Desktop/FolderB/'
    makinRain(source,destination)


def makinRain(source,destination):   
    listfile= os.listdir(source)
    # added round for humans and to conserve memory 
    last24 = round(time.time()) - 86400

    print ("These files were moved: ")
    for files in listfile:
        SourceFile = os.path.join(source,files)
        mod = os.path.getmtime(SourceFile)
        if mod > last24 and not files.endswith(".DS_Store"):
        # .DS_Store are (invisible) files in Mac folders
            shutil.copy(SourceFile,destination)
            print (files)


if __name__=='__main__':
    main()

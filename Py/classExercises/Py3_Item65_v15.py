# -*- coding: utf-8 -*-
#!/usr/bin/python
# Py3.6.3 -- TCLTK 8.5.18 -- macOS 10.12.6 (Sierra)/darwin
# Glantz, 08Nov017
#  Drill: GUI for modified files backup (copy of files);
#     *user chosen source, and destination folder
#     *user initiates the copy (Backup) process
# Item 65 Drill version: ** 15 ** (when approved this will be changed to final version 1.0)


import shutil, os, time
from tkinter import *
from tkinter import filedialog
import tkinter as tk

window = tk.Tk()
##window.withdraw()
window.title("Happy Holidays! *<|:-}}") # This can be a seasonal message
window.configure(background="lightgrey")


def ickyTikyGui():
    # App Header:
    Label(window, text="Daily File Backup", width=40, height=3, bg="skyblue", fg="black",
          font="none 24 bold") .grid(row=0, column=0, columnspan=5, padx=40, pady=40)
    
    # Pick Source: (NOTE! Folder source location prints in app from Choice1 function code)
    Label(window, text="Which folder should be checked for \nnew and recently modified files?", width=30, height=4,
          bg="lightgrey", fg="black", font="none 14 bold") .grid(row=1, column=0, columnspan=3, padx=20, pady=2)
    Button(window, text="Click to choose \nsource folder", width=15, height=3, bg="#ededed", fg="black",
           font="none 14 bold", command=Choice1) .grid(row=2, column=0, columnspan=3, padx=2, pady=2)
   
    # Pick Dexsination: (NOTE! Folder destination location prints in app from Choice2 function code)
    Label(window, text="Which folder should be used \nfor the backup copies?", width=30, height=4,
          bg="lightgrey", fg="black", font="none 14 bold") .grid(row=1, column=3, columnspan=3, padx=20, pady=2)
    Button(window, text="Click to choose \ndestination folder", width=15, height=3, bg="#ededed", fg="black",
           font="none 14 bold", command=Choice2) .grid(row=2, column=3, columnspan=3, padx=2, pady=2)

    # User initiated running of program: (NOTE! Completion text runs from MakinRain function code)
    Label(window, text="  ", width=40, height=3,
          bg="lightgrey", fg="lightgrey", font="none 14 bold") .grid(row=4, column=0, columnspan=5, padx=2, pady=2)
    Label(window, text="Ready to back up the new and modified files?", width=40, height=2,
          bg="lightgrey", fg="black", font="none 14 bold") .grid(row=5, column=0, columnspan=5, padx=5, pady=5)
    Button(window, text="Make it so Number One! \n(Click to run the program)", width=20, height=3, bg="#ededed", fg="black",
           font="none 14 bold", command=makinRain) .grid(row=6, column=0, columnspan=5, padx=2, pady=2)
    
    # Close program: 
    Label(window, text=" ", width=40, height=2,
          bg="lightgrey", fg="black", font="none 14 bold") .grid(row=8, column=0, columnspan=5, padx=2, pady=2)
    Label(window, text="That was fun ... or at least easy?", width=40, height=2,
          bg="lightgrey", fg="black", font="none 14 bold") .grid(row=9, column=0, columnspan=5, padx=2, pady=2)
    Button(window, text="Click to close program", width=20, height=3, bg="#ededed", fg="black",
           font="none 14 bold", command=Done) .grid(row=10, column=0, columnspan=5, padx=10, pady=2)
    Label(window, text=" ", width=40, height=1,
          bg="lightgrey", fg="black", font="none 14 bold") .grid(row=11, column=0, columnspan=5, padx=2, pady=2)


# Selects source folder to check for modified files
def Choice1():
    global pick1
    pick1 = filedialog.askdirectory()
    Label(master=window,text="Source:folder \n" + pick1, width=30, height=3,
          bg="lightyellow", fg="black", font="none 14 bold") .grid(row=3, column=0, columnspan=3, padx=10, pady=10)
    print("Source folder: " + pick1)


# Selects destination folder to place backups
def Choice2():
    global pick2
    pick2 = filedialog.askdirectory()
    Label(master=window,text="Destination folder: \n" + pick2, width=30, height=3,
          bg="lightyellow", fg="black", font="none 14 bold") .grid(row=3, column=3, columnspan=2, padx=10, pady=10)
    print("Destination folder: " + pick2)

   
def makinRain():
    source = pick1
    destination = pick2
    listfile = os.listdir(source)
    last24 = round(time.time()) - 86400
    
    print ("These files were copied to backup: ")
    for files in listfile:
        SourceFile = os.path.join(source,files)
        mod = os.path.getmtime(SourceFile)
        if mod > last24 and not files.endswith(".DS_Store"):
        # .DS_Store are (invisible) files in Mac folders*
            shutil.copy(SourceFile,destination)
            print (files)
    Label(master=window,text="Mission complete.  \nSee you tomorrow!", width=25, height=2,
          bg="lightgreen", fg="black", font="none 14 bold") .grid(row=7, column=0, columnspan=5, padx=10, pady=20)

   
def Done():
    window.destroy()
    exit()

ickyTikyGui()
window.mainloop()
##if __name__=='__main__':
##    ickyTikyGui()















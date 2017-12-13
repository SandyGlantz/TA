# -*- coding: utf-8 -*-
#!/usr/bin/python
# Py3.6.3 --TCLTK 8.5.18 -- SQLite3 -- macOS 10.12.6 (Sierra)/darwin
# Glantz -- 13Nov2017 -- Item 66 Drill


    #criteria:
"""
    √ GUI for modified files backup (copy of files);
    √ user chosen source, and destination folder
    √ user initiates the copy (Backup) process
    √ the copying of files is based on the last backup time
    √ the first-run default should be set to 24 hours prior (per instructor info)
"""


import shutil, os, time, sqlite3, datetime
from datetime import date, timedelta, datetime
from tkinter import *
from tkinter import filedialog, messagebox
import tkinter as tk



###############################  -- The GUI -- ###############################

window = tk.Tk()
window.title("Happy Holidays! *<|:-}}")  # This can be a seasonal message
window.configure(background="lightgrey")

def ickyTikyGui():
    # App Header:
    Label(window, text="Daily File Backup", width=40, height=2, bg="skyblue", fg="black",
          font="none 24 bold") .grid(row=0, column=0, columnspan=5, padx=30, pady=30)

    # Pick Source: (NOTE! Folder source location prints in app from Choice1 function code)
    Label(window, text="Which folder should be checked for \nnew and recently modified files?", width=30, height=3,
          bg="lightgrey", fg="black", font="none 14 bold") .grid(row=1, column=0, columnspan=3, padx=20, pady=0)   
    Button(window, text="Click to choose \nsource folder", width=15, height=3, bg="#ededed", fg="black",
           font="none 14 bold", command=Choice1) .grid(row=2, column=0, columnspan=3, padx=2, pady=0)

    # Pick Dexsination: (NOTE! Folder destination location prints in app from Choice2 function code)
    Label(window, text="Which folder should be used \nfor the backup copies?", width=30, height=3,
          bg="lightgrey", fg="black", font="none 14 bold") .grid(row=1, column=3, columnspan=3, padx=20, pady=0)   
    Button(window, text="Click to choose \ndestination folder", width=15, height=3, bg="#ededed", fg="black",
           font="none 14 bold", command=Choice2) .grid(row=2, column=3, columnspan=3, padx=2, pady=0)

    # User initiated running of program: (NOTE! Completion text runs from MakinRain function code)
    Label(window, text="Ready to back up the new and modified files?", width=40, height=2,
          bg="lightgrey", fg="black", font="none 14 bold") .grid(row=5, column=0, columnspan=5, padx=5, pady=(50,0))
    Button(window, text="Make it so Number One! \n(Click to run the program)", width=20, height=3, bg="#ededed", fg="black",
           font="none 14 bold", command=makinRain) .grid(row=6, column=0, columnspan=5, padx=2, pady=(0,50))
   
    # Close program: 
    Label(window, text="That was fun ... or at least easy?", width=40, height=2,
          bg="lightgrey", fg="black", font="none 14 bold") .grid(row=9, column=0, columnspan=5, padx=2, pady=(30,0))
    Button(window, text="Click to close program", width=20, height=3, bg="#ededed", fg="black",
           font="none 14 bold", command=Done) .grid(row=10, column=0, columnspan=5, padx=2, pady=(0,30))




###############################  -- The database and defaults -- ###############################

#runs first, to establish 24hrs ago starting value in table
def create_table():  
    conn = sqlite3.connect('BackUpLog.db')
    c = conn.cursor()
    
    c.execute("CREATE TABLE IF NOT EXISTS lastBackUpTbl(unix REAL, datestamp REAL)")
    c.execute("SELECT * FROM lastBackUpTbl")
    results = c.fetchall()
    unixDayAgo = round(time.time()) - 86400
    unixDayAgoFormat = datetime.fromtimestamp(int(time.time())).strftime('%Y %a %b %d %H:%M:%S')

    if len(results) == 0:  #option: use getCount()
        c.execute("INSERT INTO lastBackUpTbl (unix,datestamp) VALUES (?, ?)",
              (unixDayAgo, datetime.now() - timedelta(days=1)))
        Label(window, text="Last backup at: \n" + unixDayAgoFormat, width=35,
              height=3, bg="lightyellow", fg="black",font="none 14 bold").grid(row=7,
              column=0, columnspan=5, padx=2, pady=(20,20))       
    else:
        c.execute("SELECT max(unix) FROM lastBackUpTbl")
        lastUnix = c.fetchone()[0]
        lastunixFormat = datetime.fromtimestamp(int(lastUnix)).strftime('%Y %a %b %d %H:%M:%S')
        Label(window, text="Last backup at: \n" + lastunixFormat, width=35,
              height=3, bg="lightyellow", fg="black", font="none 14 bold") .grid(row=7,
              column=0, columnspan=5, padx=2, pady=(20,20))
       
    conn.commit()
    conn.close()


def SetNewBackupTime(): 
    conn = sqlite3.connect('BackUpLog.db')
    c = conn.cursor()    
    unixToday = round(time.time())
    today = datetime.now()
   
    c.execute("INSERT INTO lastBackUpTbl (unix,datestamp) VALUES (?, ?)", (unixToday, today))
    conn.commit()
    conn.close()




###############################  -- User initiated Folder Choices -- ###############################
    
# Selects source folder to check for modified files
def Choice1():
    global pick1
    pick1 = filedialog.askdirectory()
    Label(master=window,text="Source:folder \n" + pick1, width=30, height=3,
          bg="lightyellow", fg="black", font="none 14 bold") .grid(row=3, column=0, columnspan=3, padx=10, pady=10)

# Selects destination folder to place backups
def Choice2():
    global pick2
    pick2 = filedialog.askdirectory()
    Label(master=window,text="Destination folder: \n" + pick2, width=30, height=3,
          bg="lightyellow", fg="black", font="none 14 bold") .grid(row=3, column=3, columnspan=2, padx=10, pady=10)




###############################  -- File copy based on last update -- ###############################
    
def makinRain(): 
    conn = sqlite3.connect('BackUpLog.db')
    c = conn.cursor()

    source = pick1
    destination = pick2
    listfile = os.listdir(source)

    c.execute("SELECT max(unix) FROM lastBackUpTbl")
    lastUnix = c.fetchone()[0]
    lastunixConvert = datetime.fromtimestamp(int(lastUnix)).strftime('%Y %a %b %d %H:%M:%S')
    unixSince = time.time() - lastUnix
   
    Label(master=window,text="Mission complete at: \n" + lastunixConvert, width=35, height=3,
          bg="lightgreen", fg="black", font="none 14 bold") .grid(row=7, column=0, columnspan=5, padx=2, pady=(20,20))

    if unixSince > 0:        
        listfile = os.listdir(source)
        print ("These files were copied to backup: ")
        for files in listfile:
            SourceFile = os.path.join(source,files)
            mod = os.path.getmtime(SourceFile)
            if mod > lastUnix and not files.endswith(".DS_Store"):
                # .DS_Store are (invisible) files in Mac folders*
                shutil.copy(SourceFile,destination)
                print (files)

    conn.commit()    
    conn.close()
    SetNewBackupTime()



    
###############################  -- Clean close -- ###############################

def Done():
    window.destroy()
    exit()




###############################  -- The details -- ###############################
    
create_table()
ickyTikyGui()
window.mainloop()



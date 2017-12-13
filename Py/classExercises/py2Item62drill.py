# -*- coding: utf-8 -*-
#!/usr/bin/python

# Item 62 Drill 
# Python2.7.14 -- SQLite3 -- TCLTK 8.5.18 -- macOS 10.12.6 (Sierra) -- Darwin
# Glantz, 26oct2017

# Python Drill: PyDrill_Datetime_27_idle
# Drill: Create a program that determines if London and NYC branch
#        offices are open, based on Portland HQ time ...



import datetime
from datetime import date
from datetime import time
from datetime import datetime

today=datetime.now()


def NYC():
    if today.hour >= 6 and today.hour < 18:
        print("The New York City Office is open.")
    elif today.hour is 18 and today.minute is 0:
        print("The New York City Office is open.")
    else:
        print("The New York City Office is closed.")


def London():
    if today.hour >= 1 and today.hour < 13:
        print("The London Office is open.")
    elif today.hour is 13 and today.minute is 0:
        print("The London Office is open.")
    else:
        print("The London Office is closed.")

        

print("  ") #used for improved readability in output
NYC()
print("  ") #used for improved readability in output
London()




# -*- coding: utf-8 -*-

#Chapter9 python day ... Item 29

def letsAdd(x,y):
    addition =x + y
    return addition
print letsAdd(3,5)

def letsAdd(x,y):
    addition =x + y
    someValue = 10
    return addition
# print someValue (errors undefined)


someValue = 5
def letsAdd(x,y):
    addition =x + y
    return addition
print someValue

def subtraction(x,y):
    subtract = x-y
    return subtract
print subtraction(10,4)

def moreSubtraction(x,y,z):
    subtract = x-y-z
    return subtract
print moreSubtraction(40,3,11)

#multiplication exercise:
def multiplication(x,y):
    multiply = x*y
    return multiply
print multiplication(0,4)

#division exercise:
def division(x,y):
    divide = float(x)/float(y)
    return divide
print division(4,3)

length = len("How epic are built-in functions, eeh?")
print length

x = 23
print str(x)
x = 2.32
print str(x)

y = float(40)/float(7)
print y
yInt = int(y)
print yInt
print round(y)
print int(round(y))





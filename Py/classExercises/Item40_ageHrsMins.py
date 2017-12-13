
#Python Item 40 exercises



#This version was as instructed - but it prints age twice :-/ and seems sloppy

print("This program determines how long you have lived in days, minutes and seconds")
print("  ")
name = input("What is your name?: ")
print("Please enter your age: ")
age = int(input("age: "))
days = age * 365
minutes = age * 525948
seconds = age * 31556926

print(name, "has been alive for", days,"days", minutes, "minutes and", seconds, "seconds.")





print("  ")
print("  ")
#This version does the same thing, without redunancy and better output:-)


print("This program determines how long you have lived in days, minutes, and seconds")


def comma(num):
    if type(num) == int:
        return '{:,}'.format(num)
    elif type(num) == float:
        return '{:,.2f}'.format(num) 
    else:
        print("Please enter a whole number for your age")


print("  ")
name = input("Hi!  What's your name?: ")
age = int(input("Please enter your age: "))

''' in a perfect world there should be something here (like a function for age) if someone enters
"20.5" or "twenty"; to ask for a whole number.   I thought the comma function could kill two birds
with one stone ...but it didn't work as intended for the error part ... '''

days = age * comma(365)
minutes = age * comma(525948)
seconds = age * comma(31556926)

print(name, "has been alive for", days,"days,", minutes, "minutes, and", seconds, "seconds." )



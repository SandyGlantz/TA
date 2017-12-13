
#Python, Item 36

# I used print " " to put spaces in the output between questions
# did try creating a function and/or creating a variable (ExtraSpace) - but got syntax errors ...



# Assign an integer to a variable
TypicalHoursStudied = 10
print TypicalHoursStudied


print "     "
# Assign a string to a variable
WeeklyHoursStudied = '48'
# another example: WeeklyHoursStudied = 'Never enough, LOL!'
print WeeklyHoursStudied
print type(WeeklyHoursStudied)


print "     "
# Assign a float to a variable
AverageHoursStudied = float(48)/float(TypicalHoursStudied)
AverageHoursStudied2 = 48/TypicalHoursStudied
print AverageHoursStudied
print AverageHoursStudied2 # added this to make sure I was getting the right return w/float


print "     "
# Use the print function and .format() notation to print out the variable you assigned  
AverageHoursStudied = float(48)/float(TypicalHoursStudied)
print("\nYou studied {} hours a day, an average of {} days".format(TypicalHoursStudied,AverageHoursStudied))


print "     "
# Use each of these operators +, -, *, /, +=, =, %

#addition (+)
print 3.14 + 2

#subtraction (-)
print 24 - 10.5

#multiplication (*)
print 9.666 * 4

#division  (/)
print 9 / 3

#plus equal (+=)
x = 3
x += 5
print x

# Equal operator (=)
y =  2 + 5
print y

#percent symbol (%) aka modulus operator
print 16%3



print "     "
# Use of logical operators: and (&), or(|), not(!=)

# and
print 2<12 and 11>12
print 2<12 & 11>12

# or
print 2<12 or 11>12
print 2<12 | 11>12

# not
print(not(2 == 12)) 
print 2 != 12







print "     "
# Use of conditional statements: if, elif, else
print type(WeeklyHoursStudied)
print int(WeeklyHoursStudied)

IntWeeklyHours = int(WeeklyHoursStudied) #WeeklyHoursStudied was a string example earlier)
if IntWeeklyHours == 40:
    print "Great job getting a full week of studying done!"
elif IntWeeklyHours < 40:
    print "Don't be a slacker!"
elif IntWeeklyHours > 40:
    print "Be sure to exercise if you're studying extra hours."
else:
    print "Whoa! Something went wrong in this if-elif-else example."







print "     "
# Use of a while loop
i = 0
while i < 3:
    print i
    i = i + 1




print "     "
# Use of a for loop
for a in range (0, 8):
    print a

for i in range(3):
    print('This is a FOR loop example')


print "     "
# Create a list and iterate through that list using a for loop to print each item out on a new line

HealthyFood = ["Broccoli", "Avocado", "Blueberries", "Asparagus", "Alaska Salmon"]

for FoodItem in HealthyFood:
    print "Be sure to eat " + FoodItem + "."




print "     "
# Create a tuple and iterate through it using a for loop to print each item out on a new line

TupleForLoop = ("This ", "is ", "a ", "Tuple.")
for x in TupleForLoop:
    print x






print "     "
# Define a function that returns a string variable

def SayHi(greeting):
    greeting = 'Hello from Python 2.7'
    return greeting


print "     "
# Call the function you defined above and print the result to the shell
print SayHi('greeting')











print "#yDay chapter 12 - Item 33"
print "------------------------------"

epic_programmer_dict = {
    'Tim Berners-Lee' : 'tbl@gmail.com',
    'Guido van Rossum' : 'gvr@gmail.com',
    'Linus Torvalds' : 'lt@gmail.com',
    'Larry Page' : 'lp@gmail.com',
    'Sergey Brin' : 'sb@gmail.com'
    }
# print epic_programmer_dict
# print "------------------------------"

epic_programmer_dict = {
    'Tim Berners-Lee' : ['tbl@gmail.com', 111],
    'Guido van Rossum' : ['gvr@gmail.com', 222],
    'Linus Torvalds' : ['lt@gmail.com', 333],
    'Larry Page' : ['lp@gmail.com', 444],
    'Sergey Brin' : ['sb@gmail.com', 555]
    }
# print epic_programmer_dict
# print "------------------------------"
# print "------------------------------"


# print epic_programmer_dict['Tim Berners-Lee']
# print "------------------------------"
# print epic_programmer_dict['Tim Berners-Lee'][1]
# print "------------------------------"
# print "------------------------------"


# personsName = raw_input('Please enter the programmer\'s name: ')
# print personsName + " is a great programmer!"
# print "------------------------------"

# personsInfo = epic_programmer_dict[personsName]
# print personsInfo
# print "------------------------------"
# print "------------------------------"


epic_programmer_dict = {
    'tim berners-lee' : ['tbl@gmail.com', 111],
    'guido van rossum' : ['gvr@gmail.com', 222],
    'linus torvalds' : ['lt@gmail.com', 333],
    'larry page' : ['lp@gmail.com', 444],
    'sergey brin' : ['sb@gmail.com', 555]
    }
print epic_programmer_dict
print "------------------------------"
print "------------------------------"


def searchPeople(personsName):
    try:
        personsInfo = epic_programmer_dict[personsName]
        print 'Name: ' + personsName.title()
        print 'Email: ' + personsInfo[0]
        print 'Number: ' + str(personsInfo[1])
    except:
        print "Hmmm ... I don't see amything for that name."

userWantsMore = True
while userWantsMore == True:
    personsName = raw_input('I\'m here to serve. What name should I look for? ').lower()
    searchPeople(personsName)
    
    searchAgain = raw_input('Would you like to search again? (y/n): ')
    if searchAgain == 'y':
        userWantsMore = True
    elif searchAgain == 'n':
        userWantsMore = False
        print "Thanks for playing!"
    else:
        userWantsMore = False
        print "You could at least give a proper reply."



        




    

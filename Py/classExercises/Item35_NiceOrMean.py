#Python 2.7.14
#Sandy Glantz via Dan Christie TA video Nice or Mean

print "Python Item 35"
print "---------------------------------"
print "---------------------------------"

'''
def start():
    print ("What\'s up {}?".format(get_number()))

def get_number():
    name = raw_input("What is your name? ")
    return name

if __name__ == "__main__":
    start()
    
'''
# End of first exercise

'''
def start():
    f_name = "Sarah"
    l_name = "Connor"
    age = 28
    gender = "Female"
    get_info(f_name,l_name,age,gender)

def get_info (f_name,l_name,age,gender):
    print("My name is {} {}. I am {} years old.".format(f_name, l_name, age, gender))

if __name__ == "__main__":
    start()

'''
# End of second exercise


def start(nice=0,mean=0,name=""):
    # get user's name
    name = describe_game(name)
    nice,mean,name = nice_mean(nice,mean,name)


def describe_game(name):
    ''' Checks if new game; if new, get user's name.
    If not new game - thank player for playing again
    and continue with game   '''
    if name != "": # if no name they are new - and need to get name
        print("\nThank you for playing again, {}!".format(name))
    else:
        stop = True
        while stop:
            if name == "":
                name = raw_input("\nWhat is your name? ").capitalize()
                if name != "":
                    print("\nWelcome aboard {}!".format(name))
                    print("\nYou will meet several people. \nYou can be nice or mean.")
                    print("Your actions will determine your fate.")
                    stop = False
    return name


def nice_mean(nice,mean,name):
    stop = True
    while stop:
        show_score(nice,mean,name)
        pick = raw_input("\nA stranger approaches you ... are you nice or mean? (n/m): ").lower()
        if pick == "n":
            print("They smile, wave, and walk away ...")
            nice = (nice + 1)
            stop = False
        if pick == "m":
            print("\nThe stranger laughs in an evil tone and starts to follow you ...")
            mean = (mean+1)
            stop = False
    score(nice,mean,name) # pass the three variables to the score()


def show_score(nice,mean,name):
    print("\n{}, you currently have {} Nice, and {} Mean, points.".format(name,nice,mean))
        

def score(nice,mean,name):
    if nice > 5:
        win(nice,mean,name)
    if mean > 5:
        lose(nice,mean,name)
    else:
        nice_mean(nice,mean,name)


def win(nice,mean,name):
    print("\nNice job {}, you win! \nEveryone loves you!".format(name))
    again(nice,mean,name) #calls new variable called again


def lose(nice,mean,name):
    print("\nA hermit\'s life for you, {}. \nGood thing your Mother still loves you!".format(name))
    again(nice,mean,name)


def again(nice,mean,name):
    stop = True
    while stop:
        choice = raw_input("\nDo you want to play again? (y/n): ").lower()
        if choice == "y":
            stop = False
            reset(nice,mean,name)
        if choice == "n":
            print("\nSee you later alligator!")
            stop = False
            exit()
        else:
            print("\nPlease enter 'y' for 'YES' - or 'n' for 'NO' ")


def reset(nice,mean,name):
    nice = 0
    mean = 0
    start(nice,mean,name)
    



 
if __name__ == "__main__":
    start()






















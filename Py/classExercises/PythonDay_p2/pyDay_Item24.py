
# Python Day Chapter 8, Item 24

epic_programmer_list = ["Tim Berners-Lee",
                        "Guido van Rossum",
                        "Linus Torvalds",
                        "Larry Page",
                        "Sergey Brin",]

# book shows a comma after the last entry

#not sure why they have us print what will be an error ...
# print "Epic programmers: " + epic_programmer_list


print "An epic programmer: " + epic_programmer_list[0]
print "An epic programmer: " + epic_programmer_list[1]
print "An epic programmer: " + epic_programmer_list[2]
print "An epic programmer: " + epic_programmer_list[3]
print "An epic programmer: " + epic_programmer_list[4]

epic_programmer_list[1] = "Woz"
print epic_programmer_list

epic_programmer_list.append("Grace Hopper")
print "An epic she-wolf programmer: " + epic_programmer_list[5]


epic_programmer_list
for programmer in epic_programmer_list:
    print "An epic programmer: " + programmer

#note the book didn't end the array with a comma this time
number_list = [1,2,3,4,5]
# are underscores a thing in python?  I miss camel case ...
for x in number_list:
    print x**2


number_list = [1,2,3,4,5]
empty_number_list = [ ] 
for x in number_list:
    empty_number_list.append (x**2)
print empty_number_list



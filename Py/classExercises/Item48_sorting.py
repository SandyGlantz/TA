# Python Item 48: sorting ... woohoo!!

'''
Write your own version of the sorted() method in Python.
This method should take a list as an argument and return
a list that is sorted in ascending order.
Call your method passing in the following lists as arguments
and print out each sorted list to the shell.

This should be an algorithm that you write.
Do not use .sort() or the sorted() methods in your method.
'''

#[67, 45, 2, 13, 1, 998]
#[89, 23, 33, 45, 10, 12, 45, 45, 45]




'''
fifth example, patience is a virtue
'''
print ("Sorting without the sort method ...")
print ("  ")


drill_list = [67, 45, 2, 13, 1, 998]
new_list = []

list_length = len(drill_list)
for i in range(0, list_length): 
    x = min(drill_list)
    new_list.append(x)
    drill_list.remove(x)

print("The first drill list output in ascending order : ")
print (new_list)
#print(drill_list) used this to test everything emptied



print ("  ")

drill_list2 = [89, 23, 33, 45, 10, 12, 45, 45, 45]
new_list2 = []

list_length2 = len(drill_list2)
for i in range(0, list_length2): 
    x = min(drill_list2)
    new_list2.append(x)
    drill_list2.remove(x)

print ("And the second drill list output in ascending order ... ")
print (new_list2)




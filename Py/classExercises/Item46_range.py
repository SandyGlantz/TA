# Python Item 46



'''
1. Start IDLE and use the Python range() function
with one parameter to display thefollowing: 
0 1 2 3
'''

print("Start of first task")

Item46 = [0, 1, 2, 3, 4, 5, 6, 7, 8]
#Item46Length = len(Item46)
#for i in range(0, Item46Length): ??This would be two parameters, not one??
for i in range(4):
    print(Item46[i])




print("   ")
'''
2. Use the Python range() function with 3 parameters
to display the following: 3 2 1 0
'''
print("Start of second task")

Item46 = [0, 1, 2, 3, 4, 5, 6, 7, 8]
for i in range(3, -1, -1):
    print(Item46[i])



print("   ")
'''
3. Use the Python range() function with 3 parameters
to display the following: 8 6 4 2
'''

print("Start of third task")

Item46 = [0, 1, 2, 3, 4, 5, 6, 7, 8]
for i in range(8, 0, -2):
    print(Item46[i])



    


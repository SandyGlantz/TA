
#chapter 9 python day - Item 27 - KVP & writing a dictionary

dictionary_name = { 'item_1':'cat', 'item_2':2, 'item_3':3 }
print dictionary_name['item_1']

epic_programmer_dict = {
    'Tim Berners-Lee' : 'tbl@gmail.com',
    'Guido van Rossum' : 'gvr@gmail.com',
    'Linus Torvalds' : 'lt@gmail.com',
    }

print epic_programmer_dict
print epic_programmer_dict['Tim Berners-Lee']

epic_programmer_dict['Tim Berners-Lee'] = 'tim@gmail.com'
print 'New email for Tim: ' + epic_programmer_dict['Tim Berners-Lee']

epic_programmer_dict['Larry Page'] = 'lp@gmail.com'
print epic_programmer_dict

epic_programmer_dict['Sergey Brin'] = 'sb@gmail.com'
epic_programmer_dict['Grace Hopper'] = 'gh@gmail.com'
print epic_programmer_dict

del epic_programmer_dict['Sergey Brin']

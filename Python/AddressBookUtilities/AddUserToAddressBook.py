'''
This code creates the group 'TempGroup' within the address book then creates a person record 'p' of type ABPerson, sets
values for the first and last name of the person then adds the person to the group.
'''

import AddressBook
from AddressBook import *
ab = AddressBook.ABAddressBook.sharedAddressBook()

abGrp = ABGroupCreate()
abGrp.setValue_forProperty_('TempGroup', kABGroupNameProperty)
ABAddressBook.addRecord_(ab, abGrp)
ABAddressBook.save(ab)

p = ABPerson.alloc().init()
p.setValue_forProperty_('JOE', kABFirstNameProperty)
p.setValue_forProperty_('TEST', kABLastNameProperty)

print(p.valueForProperty_(kABFirstNameProperty))

phoneNumberMultiValue = ABMultiValueCreateMutable()
# ABMultiValueAdd(phoneNumberMultiValue, '555-555-1212', kABPhoneMobileLabel, None)
ABMultiValueAdd(phoneNumberMultiValue, '555-555-1213', kABPhoneWorkLabel, None)
ABMultiValueAdd(phoneNumberMultiValue, '999-999-9999', kABOtherLabel, None)  # "other" phone number.
p.setValue_forProperty_(phoneNumberMultiValue, kABPhoneProperty)

emailMultiValue = ABMultiValueCreateMutable()
ABMultiValueAdd(emailMultiValue, 'joetest123@my.smccd.edu', kABOtherLabel, None)  # school email address.
p.setValue_forProperty_(emailMultiValue, kABEmailProperty)

p.setValue_forProperty_('Math120, G00001234', kABNoteProperty)

# noteMultiValue = ABMultiValueCreateMutable()
# ABMultiValueAdd(noteMultiValue, 'Math120', kABOtherLabel, None)
# ABMultiValueAdd(noteMultiValue, 'G00001234', kABOtherLabel, None)
# p.setValue_forProperty_(noteMultiValue, kABNoteProperty)

ab.addRecord_(p)
abGrp.addMember_(p)
ab.save()

import AddressBook, re
from AddressBook import *
ab = AddressBook.ABAddressBook.sharedAddressBook()

first_name = ''
last_name = ''
stID = ''

idRegex = r"G\d{8}"

contacts = ab.people()
for person in contacts:
    note = person.valueForProperty_('Note')
    if note is not None:
        if re.search(idRegex, note):
            match = re.search(idRegex, note)
            stID = match.group()

            first_name = person.valueForProperty_('First')
            last_name = person.valueForProperty_('Last')

            print(first_name + " " + last_name + ": " + stID)
        else:
            pass
    else:
        pass

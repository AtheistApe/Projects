import AddressBook, re
from AddressBook import *
ab = AddressBook.ABAddressBook.sharedAddressBook()

def doesExist(group):
    grpExists = False
    # ab = AddressBook.ABAddressBook.sharedAddressBook()
    groups = ab.groups()
    for grp in groups:
        grpName = ABRecordCopyValue(grp, kABGroupNameProperty)
        if grpName == group:
            grpExists = True

    return grpExists

group = 'Fall2016'
abGrp = ABGroupCreate()
abGrp.setValue_forProperty_(group, kABGroupNameProperty)
ABAddressBook.addRecord_(ab, abGrp)
ABAddressBook.save(ab)


# if not doesExist(group):
#     abGrp = ABGroupCreate()
#     abGrp.setValue_forProperty_(group, kABGroupNameProperty)
#     ABAddressBook.addRecord_(ab, abGrp)
#     ABAddressBook.save(ab)

fileObj = open("./fall2016.txt")
fields = fileObj.readline().strip().split(',')
students_list = fileObj.readlines()
fileObj.close()

termRegex = r"((Spring|Fall|Summer)) (\d{4})"
courseRegex = r"([A-Z]+) (\d+) ([A-Z]{2,3})"
idRegex = r"G\d{8}"
nameRegex = r"\"(([a-zA-Z ]+), ([a-zA-Z .]+))\""
emailRegex = r"[a-zA-Z]+[0-9]*@my\.smccd\.edu"
phoneRegex = r"\d{3}-\d{3}-\d{4}"
waitListRegex = r"Wait List: \d{2}-[A-Z]{3}-\d{4}"

# print(students_list[7])

for student in students_list:
    if re.search(idRegex, student):
        match = re.search(idRegex, student)
        stID = match.group()
    else:
        stID = ''

    if re.search(nameRegex, student):
        match = re.search(nameRegex, student)
        full_name = match.group(1)
        last_name = match.group(2)
        first_name = match.group(3)
    else:
        full_name = ''
        last_name = ''
        first_name = ''

    if re.search(emailRegex, student):
        match = re.search(emailRegex, student)
        email = match.group()
    else:
        email = ''

    if re.search(phoneRegex, student):
        match = re.search(phoneRegex, student)
        phone = match.group()
    else:
        phone = ''

    if re.search(courseRegex, student):
        match = re.search(courseRegex, student)
        course = match.group(1) + match.group(2) + match.group(3)
    else:
        course = ''

    if re.search(waitListRegex, student):
        match = re.search(waitListRegex, student)
        waitList = match.group()
    else:
        waitList = ''

    # print('last name: ' + last_name)
    # print('first name: ' + first_name)
    # print('email: ' + email)
    # print('phone: ' + phone)
    # print('course: ' + course)
    # print

    p = ABPerson.alloc().init()
    p.setValue_forProperty_(first_name, kABFirstNameProperty)
    p.setValue_forProperty_(last_name, kABLastNameProperty)

    phoneNumberMultiValue = ABMultiValueCreateMutable()
    # ABMultiValueAdd(phoneNumberMultiValue, '555-555-1212', kABPhoneMobileLabel, None)
    # ABMultiValueAdd(phoneNumberMultiValue, '555-555-1213', kABPhoneWorkLabel, None)
    ABMultiValueAdd(phoneNumberMultiValue, phone, kABOtherLabel, None)  # "other" phone number.
    p.setValue_forProperty_(phoneNumberMultiValue, kABPhoneProperty)

    emailMultiValue = ABMultiValueCreateMutable()
    ABMultiValueAdd(emailMultiValue, email, kABOtherLabel, None)  # school email address.
    p.setValue_forProperty_(emailMultiValue, kABEmailProperty)

    note = course + ", " + stID + ", " + waitList
    p.setValue_forProperty_(note, kABNoteProperty)

    ab.addRecord_(p)
    abGrp.addMember_(p)

ab.save()

import re

fileObj = open("./fall2015.txt")
students_list = fileObj.readlines()
fileObj.close()

wwClass = []
courses = set()

termRegex = r"((Spring|Fall|Summer)) (\d{4})"
courseRegex = r"([A-Z]+) (\d+) ([A-Z]{2,3})"
idRegex = r"G\d{8}"
nameRegex = r"\"(([a-zA-Z\- ]+), ([a-zA-Z\-\(\) .]+))\""
emailRegex = r"([a-zA-Z]+[0-9]*)@my\.smccd\.edu"
phoneRegex = r"\d{3}-\d{3}-\d{4}"
waitListRegex = r"Wait List: (\d{2}-[A-Z]{3}-\d{4})"

for student in students_list:
    if re.search(nameRegex, student):
        match = re.search(nameRegex, student)
        full_name = match.group(1)
        last_name = match.group(2)
        first_name = match.group(3)
    else:
        full_name = ''
        last_name = ''
        first_name = ''

    if re.search(idRegex, student):
        match = re.search(idRegex, student)
        stID = match.group()
    else:
        stID = ''

    if re.search(emailRegex, student):
        match = re.search(emailRegex, student)
        email = match.group()
        userID = match.group(1)
    else:
        email = ''
        userID = ''

    if re.search(phoneRegex, student):
        match = re.search(phoneRegex, student)
        phone = match.group()
    else:
        phone = ''

    if re.search(courseRegex, student):
        match = re.search(courseRegex, student)
        course = match.group(1) + match.group(2) + match.group(3)
        section = match.group(3)
        if not set([course]) in courses:
            courses.update([course])
    else:
        course = ''
        section = ''

    if re.search(waitListRegex, student):
        match = re.search(waitListRegex, student)
        status = 'A'
        comment = match.group(1)
    else:
        status = 'C'
        comment = ''

    stDict = {'stID':stID, 'last_name':last_name, 'first_name':first_name,
        'status':status, 'comment':comment, 'course':course, 'section':section,
        'email':email, 'userID':userID, 'empty':''}

    wwClass.append(stDict)

fields = ['stID', 'last_name', 'first_name', 'status', 'comment', 'section', 'empty',
    'email', 'userID', 'empty', 'empty']

for course in courses:
    outPutFileName = course + '.lst'
    fileObj = open("./" + outPutFileName, "w")
    for student in wwClass:
        if student['course'] == course:
            stStr = ','.join([student[field] for field in fields])+'\n'
            fileObj.write(stStr)
    fileObj.close()

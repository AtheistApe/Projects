from twill import get_browser
from twill.commands import *
import os


def all_class_list_download(term):

    term = term.lower().split()
    semester = {'fall': '08', 'summer': '05', 'spring': '03'}
    term_year = term[1]
    term_sem = semester[term[0]]
    term_str = term_year + term_sem

    b = get_browser()
    login = 'https://websmart.smccd.edu/prod/twbkwbis.P_WWWLogin'
    b.go(login)
    # b.go('https://websmart.smccd.edu')

    fv("1", "sid", "g00003886")
    fv("1", "PIN", "031959")

    b.submit()

    follow("All Class List Download")

    fv("1", "term", term_str)

    b.submit()

    fv("1", "INCTERMDESC", "true")
    fv("1", "INCEMAIL", "true")
    fv("1", "INCPHONE", "true")
    fv("1", "INCNONREG", "true")

    b.submit()

    all_class_list = b.get_html()

    exit

    file_name = os.getcwd() + '/' + term[0] + term[1] + '.txt'
    # print(file_name)

    fileObj = open(file_name, 'w')
    fileObj.writelines(all_class_list)
    fileObj.close()


    # exit

    return all_class_list, file_name


# fall2015 = all_class_list_download('Fall 2015')
# spring2016 = all_class_list_download('Spring 2016')
# spring2015 = all_class_list_download('Spring 2015')
# fall2016 = all_class_list_download('Fall 2016')

class_list, file_name = all_class_list_download('Fall 2016')

# print(fall2015)
# print()
# print(spring2016)

# file_name = os.getcwd() + term[0] + term[1] + '.txt'

fileObj = open(file_name, 'w')
fileObj.writelines(class_list)
fileObj.close()

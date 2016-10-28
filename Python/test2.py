#!/Library/Frameworks/Python.framework/Versions/2.6/bin/python
# encoding: utf-8
class Student:
    """ Docstring for Student """

    def __init__(self, name):
        self.name = name
        self.attend = 0
        self.grades = []
        print("Hi! My name is {0}".format(self.name))

student1 = Student("Domenic")

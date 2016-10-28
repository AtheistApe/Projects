class Person():
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return "My name is {0}. I am {1} years old.".format(self.name, self.age)


class Military(Person):
    def __init__(self, name, age, rank):
        Person.__init__(self, name, age)
        self.rank = rank

    def __str__(self):
        return Person.__str__(self) + " I am a {0}".format(self.rank)


class Teacher(Person):
    def __init__(self, name, age, sub):
        Person.__init__(self, name, age)
        self.sub = sub

    def __str__(self):
        return Person.__str__(self) + " I teach {0}".format(self.sub)

class Student(Person):
    def __init__(self, name, age, loans):
        Person.__init__(self, name, age)
        self.loans = loans

class Pet():
    """ Class for our furry friends."""
    def __init__(self):
        """ TODO: Fill me in """

p1 = Person("Gary", 52)
p2 = Person("Aaryn", 50)
m1 = Military("John", 30, "Colonel")
t1 = Teacher("Evan", 51, "Math")
s1 = Student("Liu", 18, 150)
s2 = Student("Jacob", 19, 130)
p3 = Student("Holly", 23, 140)
m2 = Military("Bob", 40, "Major")

print(s1.name, s1.age, s1.loans)
print(t1)
print(3/5.0 - 4/7.0)



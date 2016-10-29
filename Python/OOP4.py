# Subclasses

# A subclass of a class inherits all the attributes and methods of the 'parent'
# class; We call the subclass a 'child' of the 'parent' class.

class Employee:

    num_of_emps = 0
    raise_amount = 1.04  # A 4% increase in pay

    def __init__(self, first, last, pay):
        self.first = first
        self.last = last
        self.pay = pay
        self.email = first + '.' + last + '@email.com'

        Employee.num_of_emps += 1

    def fullname(self):
        return '{} {}'.format(self.first, self.last)

    def apply_raise(self):
        self.pay = int(self.pay * self.raise_amount)

    @classmethod
    def set_raise_amt(cls, amount):
        cls.raise_amount = amount

    @classmethod
    def from_string(cls, emp_str):
        first, last, pay = emp_str.split('-')
        return cls(first, last, pay)

    @staticmethod
    def is_workday(day):
        if day.weekday() == 5 or day.weekday() == 6:
            return False
        return True

# When we define a subclass, we put the name of the parent class as the
# argument to the subclass in the defintion of the subclass as the example
# below shows

# class Developer(Employee):
#     pass

# Now when we create a 'Developer' object, it will inherit all the attributes
# and methods of the 'Employee' class. Since this 'Developer' class does not
# (as yet) have its own '__init__' method, it will look to the parent class
# and use its '__init__' method to create the 'Developer' object; This is
# called the 'method resolution order'. We can use the 'help' function to
# better understand the method resolution order of a given class.

# dev1 = Developer('Joe', 'Nickel', 100000)
# print(dev1.fullname())
# print(dev1.pay)
# print(dev1.email)
#
# # print(help(Developer))  # prints info about the 'Developer' class


# We can customize the subclass by modifying its methods and attributes. For
# example, here's how we can change the 'raise_amt'

class Developer(Employee):
    raise_amt = 1.10

dev1 = Developer('Joe', 'Nickel', 100000)
print(dev1.pay)
dev1.apply_raise()
print(dev1.pay)

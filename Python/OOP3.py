# Regular, class and static methods.

# Regular methods in a class automatically take the instance (self) as
# the first argument of the method. To turn a regular method into a
# class method you preface it with the '@classmethod' decorator and
# pass the class (cls) as the first argument of the method.
# Static methods don't pass anything automatically; they behave just
# like regular functions. To create a static method you preface it
# with the '@staticmethod' decorator.

class Employee:

    # 'raise_amount'  and 'num_of_emps' are class variables.
    num_of_emps = 0
    raise_amount = 1.04  # A 4% increase in pay

    # 'first', 'last', 'email' and 'pay' are instance variables.
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

    # Here we create the class method 'set_raise_amt'. Notice that we
    # have to preface the definition of the method with the decorator
    # '@classmethod' and that the first argument, representing the
    # class, is given as 'cls' (conventional standin for 'class').
    @classmethod
    def set_raise_amt(cls, amount):
        cls.raise_amount = amount

    # Suppose we want to create Employee objects from strings in the
    # format 'first-last-pay' without having to do so as follows:
    #
    # first, last, pay = emp_str.split('-')
    # emp = Employee(first, last, pay)
    #
    # Instead, we create a new class method that will serve as an
    # alternative constructor for this particular input type.
    @classmethod
    def from_string(cls, emp_str):
        first, last, pay = emp_str.split('-')
        return cls(first, last, pay)

    # Here is an example of a static method 'is_workday'. Notice that
    # we have to preface the definition with the '@staticmethod'
    # decorator and that the method 'is_workday' takes no instance
    # or class arguments ('self' or 'cls' respectively); We just pass
    # in the arguments the method requires. Static methods don't
    # operate on the instance or class.
    @staticmethod
    def is_workday(day):
        if day.weekday() == 5 or day.weekday() == 6:
            return False
        return True


emp1 = Employee('Gary', 'Church', 90000)
emp2 = Employee('Connor', 'Church', 1500)

print(emp2.raise_amount)

# Set the class variable 'raise_amt' for all objects of class
# 'Employee'
Employee.set_raise_amt(1.06)

print(emp2.raise_amount)

emp1_str = 'John-Doe-70000'
emp2_str = 'Evan-Innerst-85000'
emp3_str = 'Aaryn-Church-30000'

# Using the 'from_string' class method as an alternative constructor
# of an 'Employee' instance where employee data is structured as a
# string 'first-last-pay'.
emp3 = Employee.from_string(emp1_str)
print(emp3.email)

# More examples of class methods as alternative constructors of
# objects can be found in the datetime module.

# Test the static method 'is_workday'
import datetime
my_date = datetime.date(2016, 7, 10)

print(emp3.is_workday(my_date))

# "Magic Methods": Special methods which can be used in classes. These can also
# be used to implement operator overloading. An exapmle of operator overloading
# is '+': When used between numbers it returns their sum but when used between
# strings it concatenates the two strings:

print(3 + 5) # Sums the numbers 3 and 5 returning 8
print('3' + '5') # Concatenates the strings '3' and '5' returning '35'

# In the first case, the addition of the integer objects is actually being
# called as 'int__add__(3, 5)'. In the second case, the addition of the string
# objects is being called as 'str__add__('3', '5')'.

# The special methods are always surrounded by '__' (double underscores,
# sometimes called 'dunder'). For example, the class initialization methods
# '__init__' is one such special method that we have already been using. We
# will use some more of these special methods in our 'Employee' class example.

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

    # Two other special methods which should probably be used in every class
    # definition are '__repr__' and '__str__'. The '__repr__' method is meant
    # to be an unambigious representation of the object and should be used for
    # debugging, logging, etc; I meant to be seen by other developers. The
    # '__str__' is meant to be a readable representation of the object for the
    # end user.

    # '__repr__' will return a string that can be used to recreate the object.
    # If there is no '__str__' method defined for the class, printing the object
    # will cause the object to call the '__repr__' method.
    def __repr__(self):
        return "Employee('{}', '{}', {})".format(self.first, self.last, self.pay)

    # '__str__' will be called from the object when the object is printed.
    def __str__(self):
        return '{} - {}'.format(self.fullname(), self.email)

    # Here's a somewhat contrived example of overloading '+' to operate on Two
    # 'Employee' objects. Here 'emp1 + emp2' will return the combined salaries
    # of the two 'Employee' objects.
    def __add__(self, other):
        return self.pay + other.pay

    # As another example, we can overload the 'len' function '__len__' to
    # return the length of the 'Employee' objects 'fullname' attribute.
    def __len__(self):
        return len(self.fullname())

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

emp1 = Employee('Gary', 'Church', 90000)
emp2 = Employee('Connor', 'Church', 76000)
emp3 = Employee('Aaryn', 'Church', 95000)

print(repr(emp1)) # Returns 'Employee('Gary', 'Church', 90000)'
print(str(emp1)) # Returns 'Gary Church - Gary.Church@email.com'
print(emp1) # Returns 'Gary Church - Gary.Church@email.com'

print(emp1 + emp2) # This is equivalent to the two calls below.
print(Employee.__add__(emp1, emp2))
print(emp1.__add__(emp2))

print(len(emp1))

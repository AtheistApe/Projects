# Class Variables versus Instance Variables
# Instance variables can be unique to each object of a class whereas
# class variables are shared in common with all objects of the same
# class.

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

        # Each instantiation of a new object of the 'Employee'
        # class increases the class variable 'num_of_emps' by 1.
        Employee.num_of_emps += 1

    def fullname(self):
        return '{} {}'.format(self.first, self.last)

    def apply_raise(self):
        self.pay = int(self.pay * self.raise_amount)
        # Could also use instead:
        # self.pay = int(self.pay * Employee.raise_amount)

# When referencing a variable name from an object (self), the program
# first checks the instance for that variable name. If it is not found
# among the instance variables, it then checks the class variables. If
# not found there either, it then checks the variables in the parent
# class, etc...

# Each created instance gets assigned the 'raise_amount' of 1.04 as
# defined in the class.

# By using 'self.raise_amount' above, we can change the 'raise_amount'
# for a particular instance after the instance is created as follows:

emp1 = Employee('Gary', 'Church', 50000)
emp2 = Employee('Connor', 'Church', 20000)
print(emp2.__dict__) # Note: 'raise_amount' is not an attribute of 'emp2'
print(Employee.__dict__) # but it is an attribute of 'Employee'

emp2.raise_amount = 1.05  # add 'raise_amount' attribute to 'emp2'
print(emp2.__dict__)  # We see 'raise_amount' is now an 'emp2' attribute.

print(emp1.num_of_emps)

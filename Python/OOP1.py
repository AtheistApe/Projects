# Python Object Oriented Programming
# Example Class: Employee

# The definition of the Employee class is the 'blueprint' for the
# the creation of distinct 'Employee' instances (objects).
class Employee:
    pass

# We create two 'Employee' instances (objects), 'emp1' and 'emp2'
emp1 = Employee()
emp2 = Employee()

# Printing the objects shows they are distince instances since they
# occupy different memory addresses.
print(emp1)
print(emp2)

# We can now assign attributes to these instances using dot notation.
# Although this works, it is cumbersome. We will see a more efficient
# method to assign attributes to objects using a 'constructor' function
# within the definition of the class (see below).
emp1.first = 'Gary'
emp1.last = 'Church'
emp1.email = 'gary.church@email.com'
emp1.pay = 50000

emp2.first = 'Connor'
emp2.last = 'Church'
emp2.email = 'connor.church@email.com'
emp2.pay = 20000

# We can display the attributes of a given instance by printing it.
print(emp2.email)
print(emp1.email)

# Creating the 'Employee' class with a constructor function

class Employee:

    # This is the constructor function. When we create 'Employee'
    # instances (objects) we will pass into 'Employee()' the first
    # name 'first', the last name 'last' and the pay 'pay' as
    # arguments ('first', 'last', 'pay' and 'email' are all
    # attributes of the 'Employee' class).
    def __init__(self, first, last, pay):
        self.first = first
        self.last = last
        self.pay = pay
        self.email = first + '.' + last + '@email.com'

emp1 = Employee('Gary', 'Church', 50000)
emp2 = Employee('Connor', 'Church', 20000)

print(emp1.email)
print(emp2.email)

# Methods: Adding functionality to our class.
# Methods are functions defined within the class. These methods are
# called on instances using the same dot notation as used for
# accessing attributes.

class Employee:

    def __init__(self, first, last, pay):
        self.first = first
        self.last = last
        self.pay = pay
        self.email = first + '.' + last + '@email.com'

    # Here is a method to return the full name of an employee object
    # as a formatted string.
    def fullname(self):
        return '{} {}'.format(self.first, self.last)

emp1 = Employee('Gary', 'Church', 60000)
print(emp1.fullname())

# The following two lines are fully equivalent:

# Calling 'fullname' on the class, the class doesn't know which
# objects attributes to access, so we must tell it by passing in
# the object as an argument.
Employee.fullname(emp1)

# Calling 'fullname' on the object, 'fullname' uses the attributes
# of THAT object (self), so no argument is needed.
emp1.fullname()

print(Employee.fullname(emp1))
print(emp1.fullname())

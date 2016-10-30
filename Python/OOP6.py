# Property Decorators: Getters, Setters and Deleters.

# We start with a 'stripped down' version of our 'Employee' class example.
class Employee:

    def __init__(self, first, last):
        self.first = first
        self.last = last
        self.email = first + '.' + last + '@email.com'

    def fullname(self):
        return '{} {}'.format(self.first, self.last)

emp1 = Employee('Gary', 'Church')

print(emp1.first) # Returns 'Gary'
print(emp1.email) # Returns 'Gary.Church@email.com'
print(emp1.fullname()) # Returns 'Gary Church'

emp1.first = 'Connor' # This changes the 'first' name attribute to 'Connor' but
# doesn't modify the 'email' attribute. We would like the 'email' attribute to
# change whenever the 'first' or 'last' name attributes change.

print(emp1.first) # Returns 'Connor'
print(emp1.email) # Returns 'Gary.Church@email.com'
print(emp1.fullname()) # Returns 'Connor Church'

# We will modify our 'Employee' class replacing the 'email' attribute with an
# 'email' method (similar to the 'fullname' method):
class Employee:

    def __init__(self, first, last):
        self.first = first
        self.last = last

    def fullname(self):
        return '{} {}'.format(self.first, self.last)

    def email(self):
        return '{}.{}@email.com'.format(self.first, self.last)


emp1 = Employee('Gary', 'Church')
print(emp1.email) # Fails to print the email address because we no longer have
# an email attribute; 'email' is now a method and must be called as 'email()'.
# To get our 'Employee' objects to treat the 'email' method as an attribute, so
# it can be called without '()', we add the '@property' decorator before the
# methods definition.
class Employee:

    def __init__(self, first, last):
        self.first = first
        self.last = last

    @property # Allows treatment of 'fullname()' method as an 'fullname' attribute.
    def fullname(self):
        return '{} {}'.format(self.first, self.last)

    @property # Allows treatment of 'email()' method as an 'email' attribute.
    def email(self):
        return '{}.{}@email.com'.format(self.first, self.last)

    # Create a 'setter' which will take a 'fullname' (first and last name) as
    # an argument and set the 'first', 'last' and 'email' attributes.
    @fullname.setter
    def fullname(self, name):
        first, last = name.split(' ')
        self.first = first
        self.last = last

    # Create a 'deleter' which will take a 'fullname' (first and last name) as
    # an argument and delete the 'first', 'last' and 'email' attributes.
    @fullname.deleter
    def fullname(self):
        print('Delete Name!')
        self.first = None
        self.last = None


emp1 = Employee('Gary', 'Church')
emp2 = Employee('Paula', 'DiLeo')

print(emp1.email) # Returns 'Gary.Church@email.com'
emp1.first = 'Connor'
print(emp1.email) # Returns 'Connor.Church@email.com'

emp1.fullname = 'Jay Lehmann'
print(emp1.last) # Returns 'Lehmann'
print(emp1.email) # Returns 'Jay.Lehmann@email.com'

print(emp2.fullname)
print(emp2.email)

del emp1.fullname
print(emp1.fullname)
print(emp1.email)

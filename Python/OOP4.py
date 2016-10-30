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

emp1 = Employee('Jay', 'Lehmann', 60000)

# When we define a subclass, we put the name of the parent class as the
# argument to the subclass in the defintion of the subclass as the example
# below shows

class Developer(Employee):
    pass

# Now when we create a 'Developer' object, it will inherit all the attributes
# and methods of the 'Employee' class. Since this 'Developer' class does not
# (as yet) have its own '__init__' method, it will look to the parent class
# and use its '__init__' method to create the 'Developer' object; This is
# called the 'method resolution order'. We can use the 'help' function to
# better understand the method resolution order of a given class.

dev1 = Developer('Joe', 'Dime', 100000)
print(dev1.fullname())
print(dev1.pay)
print(dev1.email)


# print(help(Developer))
# The command above prints info about the 'Develope' class. In particular it
# prints:
#
# Help on class Developer in module __main__:
#
# class Developer(Employee)
#  |  Method resolution order:
#  |      Developer
#  |      Employee
#  |      builtins.object

# We can customize the subclass by modifying its methods and attributes. For
# example, here's how we can change the 'raise_amt'

class Developer(Employee):
    raise_amount = 1.10

print(help(Developer))

dev1 = Developer('Joe', 'Schmo', 100000)
print(dev1.fullname())
print(dev1.pay)
dev1.apply_raise()
print(dev1.pay)

# To 'initiate' a subclass with extra information not contained in the
# initialization method of the parent class, we have to provide the subclass
# with its own initialization method. For example, suppose for the 'Developer'
# class we also wish to pass in a 'programming language' attribute to describe
# the developers main programming language.

class Developer(Employee):
    raise_amount = 1.10

    def __init__(self, first, last, pay, prog_lang):
        # We will use the parent class's '__init__' to initialize the
        # 'first', 'last' and 'pay' attributes and the 'Developer' class's
        # '__init__' method will initialize the 'prog_lang' attribute. We
        # can call the parent's '__init__' method with either:
        #
        # 'super().__init__(first, last, pay)' or
        # 'Employee.__init__(self, first, last, pay)'
        #
        # The fist call can be used if our subclass inherits from only one
        # parent class (single inheritance) but we have to use the second
        # call if the subclass inherits from more than one parent (multiple
        # inheritance)
        super().__init__(first, last, pay)
        self.prog_lang = prog_lang

dev1 = Developer('Gary', 'Church', 120000, 'Python')
dev2 = Developer('Connor', 'Church', 115000, 'Java-script')
print(dev1.email)
print(dev1.prog_lang)

# Let's now create another subclass ('Manager') of the 'Employee' class.
# Instead of passing in a 'prog_lang' attribute, we will pass in a list of
# employee objects which are under the managers control. Note: in the
# '__init__' method we set the default argument of the 'employee' attribute
# to 'None' rather than '[]' (an empty list). This was done because you should
# never pass mutable data types as default arguments.
class Manager(Employee):
    def __init__(self, first, last, pay, employees=None):
        super().__init__(first, last, pay)
        if employees is None:
            self.employees = []
        else:
            self.employees = employees

    def add_emp(self, emp):
        if emp not in self.employees:
            self.employees.append(emp)

    def remove_emp(self, emp):
        if emp in self.employees:
            self.employees.remove(emp)

    def print_emps(self):
        for emp in self.employees:
            print('-->', emp.fullname())

man1 = Manager('Aaryn', 'Church', 150000, [emp1, dev1])
print(man1.email)
man1.print_emps()
man1.add_emp(dev2)
man1.print_emps()

# The 'isinstance' and 'issubclass' functions.
#
# 'isinstance(obj1, obj2)' determines if 'obj1' is an object of class
# 'obj2'. Returns 'True' or 'False'.
#
# 'issubclass(obj1, obj2)' determines if 'obj1' is a subclass of class 'obj2'.
# Returns 'True' or 'False'.

print(isinstance(man1, Manager))
print(issubclass(Manager, Employee))

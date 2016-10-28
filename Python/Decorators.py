# Decorators

# Review of higher-level functions and closures.

# Returning the output of the 'inner_function' from 'outer_function', so
# calling 'outer_function' will print "Hi!"
def outer_function():
    message = 'Hi!'

    def inner_function():
        print(message)

    return inner_function() # Execute 'inner_function' and return result.

outer_function()

# Returning the function 'inner_function' from 'outer_function'. We
# are making a 'closure'.
def outer_function():
    message = 'Hi!'

    def inner_function():
        print(message)

    return inner_function # Returns function 'inner_function'

func = outer_function()
print("The 'value' of 'func' is {}".format(func))
print("The name of 'func' is {}".format(func.__name__))
# Evaluating 'func' by calling 'func()' prints the message 'Hi!'
func()

# Now we change the previous example by allowing the outer function
# 'outer_function' to accept an argument 'msg'
print("\nA closure which accepts an argument\n")
def outer_function(msg):
    message = msg

    def inner_function():
        print(message)

    return inner_function

func = outer_function("This is my message")
print("The 'value' of 'func' is {}".format(func))
print("The name of 'func' is {}".format(func.__name__))
# Evaluating 'func' by calling 'func()' prints the message 'Hi!'
func()

# We can further eliminate the intermediate variable 'message' and
# pass the input 'msg' message directly to the 'inner_function'
# function
print("\nRemoving the intermediate variable in the closure\n")
def outer_function(msg):
    def inner_function():
        print(msg)

    return inner_function

func = outer_function("This is a new message")
print("The 'value' of 'func' is {}".format(func))
print("The name of 'func' is {}".format(func.__name__))
# Evaluating 'func' by calling 'func()' prints the message 'Hi!'
func()

# And now on to decorators. A decorator is a function that takes
# another function as an argument adds some kind of functianality
# and returns another function. It does this without altering the
# source code of the passed in function.

# The following example is the same as the previous example with
# the exception of a few name changes. It behaves exactly like the
# 'outer_function' function of the previous example.
def decorator_function(message):
    def wrapper_function():
        print(message)

    return wrapper_function

# Suppose instead of printing a message that we passed in, we
# execute a passed-in function. This is what a 'decorator' does.
print("\nExample of a 'decorator'\n")
def decorator_function(original_function):
    def wrapper_function():
        return original_function()

    return wrapper_function

def display():
    print("The display function ran")

decorated_display = decorator_function(display)

decorated_display()


# Decorating an existing function allows us to easily add functionality
# to it without changing its code. It adds this functionality within
# the wrapper of the decorator.
print("\nExample of a decorator with extra functionality added in \
the wrapper\n")
def decorator_function(original_function):
    def wrapper_function():
        print("Wrapper executed this before {}".format(original_function.__name__))
        return original_function()

    return wrapper_function

def display():
    print("The display function ran")

decorated_display = decorator_function(display)

decorated_display()

# A simplified syntax to decorate a function with a decorator is to
# place '@decorator_function' on the line immediately preceeding the
# line which defines the function as follows:
print("\nSimplified syntax for decorating a function with a decorator\n")
@decorator_function
def display():
    print("The display function ran")

display()

# This (above) simplified syntax is equivalent to setting our original
# function to the function returned by 'decorator_function' with the
# original function passed in as an argument to the decorator:
print("\nEquivalent version of simplified '@' syntax\n")
display = decorator_function(display)
display()

# Example of a decorator which decorates functions with arguments. To
# do this must pass in '*args' and '**kwargs' to the wrapper function
# and also to the original function within the wrapper. The '*args' and
# '**kwargs' allow for any number of positional or key word arguments to
# be passed in to the function.
print("\nDecorating a function which takes arguments\n")

def decorator_function(original_function):
    def wrapper_function(*args, **kwargs):
        print("Wrapper executed this before {}".format(original_function.__name__))
        return original_function(*args, **kwargs)

    return wrapper_function

@decorator_function
def display_info(name, age):
    print("'display_info' ran with arguments ({}, {})".format(name, age))

@decorator_function
def display():
    print("The display function ran")

display_info('Gary', 57)
print
display()


# Example of using a class as a decorator. Here we modify the previous
# 'decorator_function' behavior into a class.
print("\nUsing a class as a decorator\n")
class decorator_class(object):

    def __init__(self, original_function):
        self.original_function = original_function

    def __call__(self, *args, **kwargs):
        print("call method executed this before {}".format(self.original_function.__name__))
        return self.original_function(*args, **kwargs)

@decorator_class
def display_info(name, age):
    print("'display_info' ran with arguments ({}, {})".format(name, age))

@decorator_class
def display():
    print("The display function ran")

display_info('Gary', 57)
print
display()

# Practical examples of the uses of decorators.
print("\nPractical examples using decorators\n")
def my_logger(orig_func):
    import logging
    logging.basicConfig(filename='{}.log'.format(orig_func.__name__), level=logging.INFO)

    def wrapper(*args, **kwargs):
        logging.info(
            'Ran with args: {}, and kwargs: {}'.format(args, kwargs))

        return orig_func(*args, **kwargs)

    return wrapper

def my_timer(orig_func):
    import time

    def wrapper(*args, **kwargs):
        t1 = time.time()
        result = orig_func(*args, **kwargs)
        t2 = time.time() - t1
        print("{} ran in: {} sec".format(orig_func.__name__, t2))
        return result

    return wrapper

print("\nLogging information into a log file\n")
@my_logger
def display_info(name, age):
    print("'display_info' ran with arguments ({}, {})".format(name, age))

display_info('Gary', 57)
display_info('Connor', 17)
display_info('Aaryn', 55)

print("\nTiming the execution time of a function\n")
@my_timer
def display_info(name, age):
    print("'display_info' ran with arguments ({}, {})".format(name, age))

display_info('Gary', 57)

# To 'stack' decorators on a function (apply multiple decorators to a
# function) need to use the 'wraps' method from the 'functools' module.
# To use 'wraps' we must decorate each of our defined decorators (the
# wrappers) with it, passing in our original function as an argument.
print("\nUsing 'wraps' within decorators to allow for stacking multiple \
decorators\n")

from functools import wraps
def my_logger(orig_func):
    import logging
    logging.basicConfig(filename='{}.log'.format(orig_func.__name__), level=logging.INFO)

    @wraps(orig_func)
    def wrapper(*args, **kwargs):
        logging.info(
            'Ran with args: {}, and kwargs: {}'.format(args, kwargs))

        return orig_func(*args, **kwargs)

    return wrapper

def my_timer(orig_func):
    import time

    @wraps(orig_func)
    def wrapper(*args, **kwargs):
        t1 = time.time()
        result = orig_func(*args, **kwargs)
        t2 = time.time() - t1
        print("{} ran in: {} sec".format(orig_func.__name__, t2))
        return result

    return wrapper

@my_timer
@my_logger
def display_info(name, age):
    print("'display_info' ran with arguments ({}, {})".format(name, age))

display_info('Paula', 62)

# Closures

# In programming languages, closures (also lexical closures or function
# closures) are techniques for implementing lexically scoped name binding
# in languages with first-class functions. Operationally, a closure is a
# record storing a function[a] together with an environment: a mapping
# associating each free variable of the function (variables that are used
# locally, but defined in an enclosing scope) with the value or reference
# to which the name was bound when the closure was created. A
# closure-unlike a plain function-allows the function to access those
# captured variables through the closure's copies of their values or
# references, even when the function is invoked outside their scope.

# Example 1
# The function 'outer_func' defines and returns the function 'inner_func'
# which, when called,  prints the message passed into 'outer_func' as an
# argument. Even though the message is a local variable only to 'outer_func'
# it is still available in 'inner_func' after 'outer_func' has completed.


def outer_func(msg):
    message = msg

    def inner_func():
        print(message)

    # return inner_func()
    return inner_func

hi_func = outer_func("Hi!")
hello_func = outer_func("Hello!")

hi_func()  # The 'msg' variable  value "Hi!" is available to 'hi_func'
hello_func()  # The 'msg' variable value "Hello!" is available to 'hello_func'


# Example 2
def html_tag(tag):
    def wrap_text(message):
        print("<{0}>{1}<{0}>".format(tag, message))
    return wrap_text

printh1 = html_tag("h1")
printp = html_tag("p")

printh1("Hello World!")
printp("This is a paragraph in html syntax")


# Example 3
import logging
logging.basicConfig(filename='example.log', level=logging.INFO)

def logger(func):
    def log_func(*args):
        logging.info("Running {} with arguments {}".format(func.__name__, args))
        print(func(*args))
    return log_func


def add(x, y):
    return x + y

def sub(x, y):
    return x - y

add_logger = logger(add)
sub_logger = logger(sub)

add_logger(3, 3)
add_logger(4, 5)

sub_logger(10, 5)
sub_logger(20, 10)

add_logger(13, 17)

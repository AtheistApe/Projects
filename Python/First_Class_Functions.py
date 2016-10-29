# In computer science, a programming language is said to have first -
# class functions if it treats functions as first class citizens.
# Specifically, this means the language supports passing functions as
# arguments to other functions, returning them as the values from other
# functions, and assigning them to variables or storing them in data
# structures.

def logger(msg):

    def log_message():
        print("Log: {}".format(msg))

    return log_message

log_hi = logger('Hi!')

# log_hi()

# The function 'html_tag' creates and returns a function 'wrap_text'
# which wraps the text string passed into 'wrap_text' with a tag passed
# into 'html_tag' as a parameter.

def html_tag(tag):
    def wrap_text(msg):
        print('<{0}>{1}</{0}>'.format(tag, msg))

    return wrap_text

print_h1 = html_tag('h1')
print_h1("Test headline")
print_h1("Another headline!")

print_p = html_tag('p')
print_p("Test paragraph")

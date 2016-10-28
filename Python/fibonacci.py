from __future__ import division
# The fibonacci sequence


# This first attempt works fine for small values of 'n', but as the
# value of 'n' increases, the number of recursive function calls
# needed to calculate 'fibonacci(n)' increases exponentially. The
# problem is that this formulation of the fibonacci function doesn't
# store previously calculated values to use in future calls to itself.
print("\nDirect recursion with no caching of previously calculated values\n")
def fibonacci(n):
    if n == 1:
        return 1
    elif n == 2:
        return 1
    elif n > 2:
        return fibonacci(n - 1) + fibonacci(n - 2)

for n in range(1, 11):
    print("n: {0:<5} fib({0}): {1}".format(n, fibonacci(n)))

# In this next version, we will use 'memoization' to speed up our
# fibonacci function.

# Definition: In computing, memoization is an optimization technique used
# primarily to speed up computer programs by storing the results of
# expensive function calls and returning the cached result when the same
# inputs occur again.

# Using memoization, we no longer have exponential time increases in
# calculating 'fibonacci(n)' for large values of 'n'.
print("\n Using a dictionary to store previously calculated values\n")
fibonacci_cache = {} # A dictionary to store previously calculated values.

def fibonacci(n):
    # If we have cached the value, then return it
    if n in fibonacci_cache:
        return fibonacci_cache[n]

    # Compute the nth term
    if n == 1:
        value = 1
    elif n == 2:
        value = 1
    elif n > 2:
        value = fibonacci(n-1) + fibonacci(n-2)

    # Cache the value and return it
    fibonacci_cache[n] = value
    return value

for n in range(1, 1001):
    print("n: {0:<5} fib({0}): {1}".format(n, fibonacci(n)))

# Finally, we can improve our initial version using the decorator
# 'lru_cache' ('Least Recently Used Cache') from the 'functools'
# module.
print("\nUsing 'Lru_cache' decorator\n")
from functools32 import lru_cache

@lru_cache(maxsize=1000) # Cache 1000 values
def fibonacci(n):
    if n == 1:
        return 1
    elif n == 2:
        return 1
    elif n > 2:
        return fibonacci(n - 1) + fibonacci(n - 2)

for n in range(1, 501):
    print("n: {0:<5} fib({0}): {1}".format(n, fibonacci(n)))

# Let's now add some error checking to make sure the argument is a
# positive integer. This will prevent a crash in the eventuality that
# someone tries to call the function without a positive integer input.
print("\nAdded some error handling for the input\n")

@lru_cache(maxsize=500)
def fibonacci(n):
    if type(n) != int:
        raise TypeError("n must be a positive integer")
    if n < 1:
        raise ValueError("n must be a positive integer")
    if n == 1:
        return 1
    elif n == 2:
        return 1
    elif n > 2:
        return fibonacci(n - 1) + fibonacci(n - 2)

for n in range(1, 51):
    print("n: {0:<5} fib({0}): {1}".format(n, fibonacci(n)))

# The sequence of ratios of consecutive fibonacci numbers converges to
# the golden ratio.
for n in range(1, 51):
    print(fibonacci(n+1)/fibonacci(n))

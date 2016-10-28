# Generators

# A typical function which accepts a list as input and returns the list
# of the squares of the input list.


def square_numbers(nums):
    squares = []
    for num in nums:
        squares.append(num * num)
    return squares

my_squares = square_numbers([1, 3, 5, 7, 9, 11])
print(my_squares)

# Now we convert the previous function to a generator. It is the
# 'yield' keyword that makes it a generator.

def square_nums(nums):
    for num in nums:
        yield (num * num)

my_sqrs = square_nums([1, 3, 5, 7, 9, 11])
# 'my_sqrs' is now a generator object. We can verify this by printing
# it out:
print(my_sqrs)

# To get the generator to produce output (to 'yield' its results), we
# must apply the 'next' function to it. Each time 'next' is applied to
# the generator, the next result is yielded.
print(next(my_sqrs))
print(next(my_sqrs))
print(next(my_sqrs))
print(next(my_sqrs))
print(next(my_sqrs))

# If we apply 'next' past the end of the input list we get an exception.
print(next(my_sqrs))
# print(next(my_sqrs)) # 'next' applied too many times.


# It is best to use generatos is a loop to avoid using 'next' and
# running past the end of the input array.
print('\nUsing a generator in a loop')
my_sqrs = square_nums([1, 2, 3, 5, 7, 11, 13, 17])
for sqr in my_sqrs:
    print sqr

# We can also get a list of squares using a list comprehension
print("\nUsing a list comprehension")
my_sqrs = [x * x for x in [1, 2, 3, 5, 7, 11, 13, 17]]
print(my_sqrs)
for sqr in my_sqrs:
    print sqr

# We can turn the list comprehension into a generator by replacing
# the outsice brackets with parenthesis
print("\nMaking a list comprehension into a generator")
my_sqrs = (x * x for x in [1, 2, 3, 5, 7, 11, 13, 17])
print(my_sqrs)
for sqr in my_sqrs:
    print(sqr)

# We can turn the generator into a list in order to get all the output
# values at once without using a loop. However, once the generator is
# turned into a list, you lose the performance advantages the generator
# provides if the list is huge.
my_sqrs = (x * x for x in [1, 2, 3, 5, 7, 11, 13, 17])
print("\nTurning a generator into a list")
sqrs = list(my_sqrs)
print(sqrs)

# Example of the performance benefits a generator can provide.
# import mem_profile
import random
import time

names = ['Gary', 'Aaryn', 'Connor', 'Paula', 'Vince', 'Nicholas']
majors = ['Math', 'Chemistry', 'Physics', 'Biology', 'Business']

# print("Memory (Before): {}Mb".format(mem_profile.memory_usage_resource()))


def people_list(num_people):
    result = []
    for i in xrange(num_people):
        person = {
            'id': i,
            'name': random.choice(names),
            'major': random.choice(majors)
        }
        result.append(person)
    return result

def people_generator(num_people):
    for i in xrange(num_people):
        person = {
            'id': i,
            'name': random.choice(names),
            'major': random.choice(majors)
        }
        yield person

# t1 = time.clock()
# people = people_list(1000000)
# t2 = time.clock()

t1 = time.clock()
people = people_generator(1000000)
t2 = time.clock()

# print("Memory (After): {}Mb".format(mem_profile.memory_usage_resource()))
print("Took {} seconds".format(t2 - t1))

# for person in people:
#     print(person)

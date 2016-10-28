def remove_duplicates(a_list):
    new_list=[]
    for element in a_list:
        if element in new_list:
            pass
        else:
            new_list.append(element)
    return new_list
    
def remove_dups(a_list):
    new_list=[]
    for element in a_list:
        if element not in new_list:
            new_list.append(element)
        else:
            pass
    return new_list
    
def median(a_list):
    a_list = sorted(a_list)
    length = len(a_list)
    if length % 2 == 0:
        return (a_list[length/2 - 1] + a_list[length/2])/2.0
    else:
        return a_list[length/2]
        
print median([1,2,3,4])
print median([1,9,3])
    
print remove_dups([1,2,1,3,1,1,4,4,2,3,5,2,1,7,5])    
print remove_duplicates([1,2,1,3,1,1,4,4,2,3,5,2,1,7,5])

grades = [100, 100, 90, 40, 80, 100, 85, 70, 90, 65, 90, 85, 50.5]

def print_grades(grades):
    for grade in grades:
        print grade

def grades_sum(grades):
    total = 0
    for grade in grades: 
        total += grade
    return total
    
def grades_average(grades):
    sum_of_grades = grades_sum(grades)
    average = sum_of_grades / len(grades)
    return average

def grades_variance(scores,average):
    variance = 0
    for score in scores:
        variance += (score - average)**2
    return variance / len(scores)
    
def grades_variance2(scores):
    average = grades_average(scores)
    variance = 0
    for score in scores:
        variance += (score - average)**2
    return variance / len(scores)

    
def grades_std_deviation(variance):
    return variance**(0.5)
    
average = grades_average(grades)
variance = grades_variance(grades, average)
std_dev = grades_std_deviation(variance)

print average
print variance
print std_dev

squares = [x**2 for x in range(1,11)]
print filter(lambda x: (x >= 30) and (x <= 70), squares)

class Employee(object):
    """Models real-life employees!"""
    def __init__(self, employee_name):
        self.employee_name = employee_name
    
    def calculate_wage(self, hours):
        self.hours = hours
        return hours * 20.00

# Add your code below!
class PartTimeEmployee(Employee):
    def calculate_wage(self, hours):
        self.hours = hours
        return hours * 12.00

    def full_time_wage(self, hours):
        return super(PartTimeEmployee, self).calculate_wage(hours)
        
joe = PartTimeEmployee("Joe Schmoe")
print joe.calculate_wage(15)
print joe.employee_name

milton = PartTimeEmployee("Milton Freedman")
print milton.full_time_wage(10)
print milton.calculate_wage(10)
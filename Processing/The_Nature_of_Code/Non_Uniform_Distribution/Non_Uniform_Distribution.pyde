from random import uniform

def setup():
    pass
    
def draw():
    num = uniform(0, 1)
    if num < 0.6:
        println("Outcome A")
    elif num < 0.7:
        println("Outcome B")
    else:
        println("Outcome C")
    
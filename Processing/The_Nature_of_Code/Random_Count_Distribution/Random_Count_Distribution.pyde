from random import uniform

randomCounts = [0]*20

def setup():
    size(640, 240)
    frameRate(1000)

def draw():
    background(255)
    
    index = int(uniform(0, len(randomCounts)))
    randomCounts[index] += 1
    
    stroke(0)
    fill(120)
    w = width/len(randomCounts)
    
    for x in range(len(randomCounts)):
        rect(x*w, height-randomCounts[x], w-1, randomCounts[x])
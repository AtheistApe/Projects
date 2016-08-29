from random import randint, uniform, gauss

width = 640
height = 360

class Walker:
    
    def __init__(self, c):
        self.x = width/2
        self.y = height/2
        self.c = c
        
    def display(self):
        stroke(*self.c)
        ellipse(self.x,self.y,0.5,0.5)
        
    def stepInt(self):
        dirX = randint(-1,1)
        dirY = randint(-1,1)
        
        self.x += dirX
        self.y += dirY
            
    def stepNU(self): # Walker direction choice non-uniform
        choice = uniform(0, 1)
        
        if choice < 0.4: self.x += 1
        elif choice < 0.6: self.x -= 1
        elif choice < 0.8: self.y += 1
        else: self.y -= 1
        
    def stepMD(self): # Walker direction towards mouse direction
        choice = uniform(0, 1)
        if choice < 0.975:
            self.stepInt()
        else:
            stepX = mouseX - self.x
            stepY = mouseY - self.y
            if stepX * stepY == 0:
                pass
            else:
                self.x += stepX/abs(stepX)
                self.y += stepY/abs(stepY)
                
    def stepGauss(self): # Step size determined by a Gaussian distribution
        dirX = randint(-1,1)
        dirY = randint(-1,1)
        dist = gauss(2,0.5)
        
        self.x += dirX * dist
        self.y += dirY * dist
        
    def montecarlo(self):
        while True:
            r1 = uniform(0,1)
            probability = r1
            r2 = uniform(0,1)
            if r2 < probability:
                return r1

        
    def stepLevy(self): # Step size determined randomly with a frequency depending on step size
        dirX = randint(-1,1)
        dirY = randint(-1,1)
        dist = self.montecarlo() * 5mfdkk
        
        self.x += dirX * dist
        self.y += dirY * dist

    def printxy(self):
        print self.x, self.y
        
w1 = Walker((255,107,70))
w2 = Walker((234,70,255))
w3 = Walker((232,64,2000))
w4 = Walker((255,83,136))

walkers = [w1, w2, w3, w4]
        
def setup():
    size(width, height)
    background(255)
    frameRate(300)
    
def draw():
    for w in walkers:
        w.display()
        w.stepLevy()
t = 0

class Walker:
    
    def __init__(self, tx, ty, c):
        self.tx = tx
        self.ty = ty
        self.c = c
        self.x = 0
        self.y = 0
        
    def display(self):
        fill(*self.c)
        ellipse(self.x, self.y, 40, 40)
        
    def step(self):
        self.x = map(noise(self.tx), 0, 1, 0, width)
        self.y = map(noise(self.ty), 0, 1, 0, height)
        
        self.tx += 0.01
        self.ty += 0.01

w1 = Walker(0, 10000, (255,0,0))
w2 = Walker(500, 6000, (230,35,100))
w3 = Walker(3000, 900, (240,70,15))

walkers = [w1,w2,w3]

def setup():
    size(640, 360)
    noStroke()
    
    
def draw():
    background(120)
    for w in walkers:
        w.display()
        w.step()
    
    
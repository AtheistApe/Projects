from random import gauss  # gauss(mu, sigma)

mu = 320
sigma = 80
opacity = 10

def color():
    r = int(gauss(50,15))
    g = int(gauss(120,15))
    b = int(gauss(110,15))
    o = 10
    
    return (r,g,b,o)

def setup():
    frameRate(600)
    size(640,360)
    noStroke()
    # fill(255,0,0,5)
    
def draw():
    x = gauss(mu,sigma)
    fill(*color())
    ellipse(x, 180, 4, 24)
    
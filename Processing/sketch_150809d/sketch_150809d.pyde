def setup():
    size(400, 400)

class Creature: 
    
    def __init__(self, x, y, speed=1.0, size=4):
        
        self.x = x
        self.y = y
        self.speed = speed
        self.size = size
        
        self._vx = 0
        self._vy = 0
    
    def roam(self):
 
        """ Creature changes heading aimlessly.
        """
        
        v = self.speed
        self._vx += random(-v, v)
        self._vy += random(-v, v)
        self._vx = max(-v, min(self._vx, v))
        self._vy = max(-v, min(self._vy, v)) 
        
        self.x += self._vx
        self.y += self._vy
        
ant1 = Creature(300, 300, speed=2.0)
ant2 = Creature(300, 300, speed=0.5, size=8)
 
#speed(30)
def draw():
    ant1.roam()
    ant2.roam()
    ellipse(ant1.x, ant1.y, ant1.size, ant1.size)
    ellipse(ant2.x, ant2.y, ant2.size, ant2.size)

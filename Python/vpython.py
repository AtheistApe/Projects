from visual import *  # must import visual or vis first

ball1 = sphere(pos = vector(0,0,0), radius = 0.5, color = color.green)
ball2 = sphere(pos = vector(-3,4,0), radius = 0.5, color = color.cyan)
pointer = arrow(pos = ball1.pos, axis = ball2.pos - ball1.pos, color = color.orange)

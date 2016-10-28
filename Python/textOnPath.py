from nodebox.graphics import *

path = BezierPath()
path.moveto(100, 50)
path.curveto(200, 100, 300, 0, 400, 50)

txt = "NodeBox for OpenGL" # Create a Text object for each character.
glyphs = [Text(char, fontname="Droid Sans Mono", fontsize=20) for char in txt]

def draw(canvas):
    background(1)
    fill(0)
    points = path.points(amount=len(glyphs), start=0.05, end=0.95)
    for i, (angle, pt) in enumerate(directed(points)):
        push()
        translate(pt.x, pt.y)
        rotate(angle)
        text(glyphs[i], x=-textwidth(glyphs[i])/2)
        pop()
    drawpath(path, fill=None, stroke=(0,0,0,0.5))

canvas.size = 600, 150
canvas.run(draw)

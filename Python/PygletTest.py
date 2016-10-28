import pyglet
from pyglet.gl import *

window = pyglet.window.Window()

glClearColor(0.2, 0.4, 0.5, 1.0)

@window.event
def on_draw():
    glClear(GL_COLOR_BUFFER_BIT)

    glColor3f(0, 0, 0)

    glBegin(GL_TRIANGLES)
    glVertex2f(200, 100)
    glVertex2f(200, 200)
    glVertex2f(100, 200)

    glVertex2f(300, 100)
    glVertex2f(300, 300)
    glVertex2f(100, 300)
    glEnd()

pyglet.app.run()
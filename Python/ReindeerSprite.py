import pyglet

reindeer_image = pyglet.image.load('/Users/gary/Documents/PythonProjects/reindeer.png')
reindeer = pyglet.sprite.Sprite(reindeer_image, x=50, y=50)

window = pyglet.window.Window()

def update(dt):
    reindeer.x += dt*20
    reindeer.y += dt*5

pyglet.clock.schedule_interval(update, 1/60.)

@window.event
def on_draw():
    window.clear()
    reindeer.draw()

pyglet.app.run()

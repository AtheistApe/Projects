import pyglet

window = pyglet.window.Window()
image = pyglet.resource.image('kitten.jpg')

label = pyglet.text.Label('Hello world',
                           font_name = 'Times New Roman',
                           font_size = 36,
                           x = window.width//2, y = window.height//2,
                           anchor_x = 'center', anchor_y = 'center')

@window.event
def on_draw():
    window.clear()
    image.blit(0, 0)
    label.draw()

pyglet.app.run()

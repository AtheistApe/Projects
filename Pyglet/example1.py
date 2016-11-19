import pyglet
from pyglet.window import key
import os

img_dir = os.path.join(os.path.dirname(__file__), 'img')
snd_dir = os.path.join(os.path.dirname(__file__), 'snd')

window = pyglet.window.Window()
image = pyglet.resource.image(os.path.join(img_dir,'kitten.jpg'))

music = pyglet.resource.media(os.path.join(snd_dir, 'tgfcoder-FrozenJam-SeamlessLoop.wav'), streaming=False)
music.play()

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

@window.event
def on_key_press(symbol, modifiers):
    if symbol == key.A:
        print 'The "A" key was pressed.'
    elif symbol == key.LEFT:
        print 'The left arrow was pressed.'
    elif symbol == key.ENTER:
        print 'The enter key was pressed'

pyglet.app.run()

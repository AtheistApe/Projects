import pyglet
from pyglet.window import key

car_img = pyglet.image.load('carimg.png')
car = pyglet.sprite.Sprite(car_img, x=50, y=50)
car_speed = 150

window = pyglet.window.Window()

label = pyglet.text.Label('Hello, Gary!',
                        font_name='Pacifico',
                        font_size=36,
                        x=window.width//2, y=window.height//2,
                        anchor_x='center', anchor_y='center')

# @window.event
# def on_key_press(symbol, modifiers):
#     print("The '{}' key was pressed".format(chr(symbol)))

# @window.event
# def on_key_press(symbol, modifiers):
#     if symbol == key.LEFT:
#         car.x -= 1
#     elif symbol == key.RIGHT:
#         car.x += 1
#     elif symbol == key.UP:
#         car.y -= 1
#     elif symbol == key.DOWN:
#         car.y += 1

keys = key.KeyStateHandler()
window.push_handlers(keys)

if keys(key.RIGHT):
    car.x += 1

@window.event
def on_draw():
    window.clear()
    label.draw()
    car.draw()

def update(dt):
    car.x += car_x * dt
    car.y += car_y * dt

if __name__ == '__main__':
    pyglet.clock.schedule_interval(update, 1/60)
    pyglet.app.run()

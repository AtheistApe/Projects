from tkinter import *
import random
import time

WIDTH = 800
HEIGHT = 600

color_lst = ['red', 'blue', 'green', 'yellow', 'orange',
             'purple', 'cyan', 'magenta', 'pink']

tk = Tk()
canvas = Canvas(tk, width=WIDTH, height=HEIGHT)
tk.title("Motion")
canvas.pack()

ball = canvas.create_oval(10, 10, 60, 60, fill="orange")
xspeed = 1
yspeed = 2

while True:
    canvas.move(ball, xspeed, yspeed)
    # 'pos' is a list of four coordinates: first two for the upper left
    # corner of the bounding box of the canvas and the last two for
    # the lower right corner of the canvas bounding box.
    pos = canvas.coords(ball)
    if pos[3] >= HEIGHT or pos[1] <= 0:
        yspeed *= -1
    if pos[0] <= 0 or pos[2] >= WIDTH:
        xspeed *= -1

    tk.update()
    time.sleep(0.01)

canvas.mainloop()

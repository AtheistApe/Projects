from tkinter import *
import random
import time

WIDTH = 800
HEIGHT = 600

# color_lst = ['red', 'blue', 'green', 'yellow', 'orange',
#              'purple', 'cyan', 'magenta', 'pink']

colors = ['red', 'blue', 'green', 'yellow',
          'orange', 'pink', 'cyan', 'magenta',
          'black', 'brown', 'gold', 'violet',
          'goldenrod', 'powder blue', 'steel blue']

tk = Tk()
canvas = Canvas(tk, width=WIDTH, height=HEIGHT)
tk.title("Motion")
canvas.pack()

class Ball:
    def __init__(self, x, y, radius, xspeed, yspeed, color):
        self.shape = canvas.create_oval(x-radius, y-radius, x+radius, y+radius, fill=color)
        self.xspeed = xspeed
        self.yspeed = yspeed
        self.color = color

    def move(self):
        pos = canvas.coords(self.shape)
        if pos[3] >= HEIGHT or pos[1] <= 0:
            self.yspeed *= -1
            canvas.itemconfig(self.shape, fill=random.choice(colors))
        if pos[0] <= 0 or pos[2] >= WIDTH:
            self.xspeed *= -1
            canvas.itemconfig(self.shape, fill=random.choice(colors))

        canvas.move(self.shape, self.xspeed, self.yspeed)


balls = []
for i in range(150):
    ball = Ball(random.randrange(100, WIDTH-100),
                random.randrange(100, HEIGHT-100),
                random.randrange(10, 40),
                random.randrange(-5,5),
                random.randrange(-5,5),
                random.choice(colors))

    balls.append(ball)

while True:
    for b in balls:
        b.move()
        # 'pos' is a list of four coordinates: first two for the upper left
        # corner of the bounding box of the canvas and the last two for
        # the lower right corner of the canvas bounding box.

    tk.update()
    time.sleep(0.01)

canvas.mainloop()

from tkinter import *
import random

WIDTH = 800
HEIGHT = 600

color_lst = ['red', 'blue', 'green', 'yellow', 'orange',
             'purple', 'cyan', 'magenta', 'pink']

tk = Tk()
canvas = Canvas(tk, width=WIDTH, height=HEIGHT)
tk.title("Drawing")
canvas.pack()

# canvas.create_line(0, 0, 500, 400)
# canvas.create_rectangle(100, 100, 250, 250, fill="blue")
# canvas.create_oval(10, 10, 50, 50, fill="green")
# canvas.create_polygon(400, 10, 300, 300, 500, 300, fill="purple")

for i in range(100):
    x1 = random.randrange(WIDTH)
    y1 = random.randrange(HEIGHT)
    x2 = random.randrange(WIDTH)
    y2 = random.randrange(HEIGHT)

    col = random.choice(color_lst)
    canvas.create_rectangle(x1, y1, x2, y2, fill=col)
    canvas.create_oval(x1, y1, x2, y2, fill=random.choice(color_lst))

canvas.mainloop()

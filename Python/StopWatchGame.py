''' 
Stopwatch: The Game.

I added code to allow for a variable frame size which
always keeps the time string centered on the frame and
the score string located in the upper right corner of
the frame.

Also, I added global variables to allow for easy changing
of the font sizes and colors of the time and score strings.
'''

import simplegui

# define global variables
tenths_sec = 0

width = 350
height = 250

time_text_size = 60
time_text_color = "Yellow"

score_text_size = 36
score_text_color = "Red"

num_stops = 0
num_wins = 0

Stop = True


# define helper function format that converts time
# in tenths of seconds into formatted string A:BC.D
def format_time(t):
    tenths = str(t % 10)
    seconds = int(t / 10)
    minutes = str(int(seconds / 60))
    secs = seconds % 60
    if secs < 10:
        secs = "0" + str(secs)
    else:
        secs = str(secs)

    return minutes + ":" + secs + "." + tenths


def format_score():
    return str(num_wins) + "/" + str(num_stops)


# returns the lower left corner of a text string in order to
# center the string in the canvas.
def time_pos(number):
    text_width = frame.get_canvas_textwidth(
        format_time(number), time_text_size)
    x_pos = 0.5 * (width - text_width)
    y_pos = 0.5 * (height + 0.5 * time_text_size)
    return [x_pos, y_pos]


def score_pos(score):
    text_width = frame.get_canvas_textwidth(score, score_text_size)
    x_pos = width - 1.25 * text_width
    y_pos = score_text_size
    return [x_pos, y_pos]

# define event handlers for buttons; "Start", "Stop", "Reset"
def start_button():
    global Stop
    Stop = False


def stop_button():
    global num_stops, num_wins, Stop
    if not Stop:
        if tenths_sec % 10 == 0:
            num_wins += 1
        num_stops += 1
    Stop = True

# Resets game to initial state.
def reset_button():
    global tenths_sec, num_stops, num_wins, Stop
    Stop = True
    tenths_sec = 0
    num_stops = 0
    num_wins = 0


# define event handler for timer with 0.1 sec interval
def tick():
    global tenths_sec
    if not Stop:
        tenths_sec += 1

# define draw handler
def draw(canvas):
    canvas.draw_text(format_time(tenths_sec), time_pos(tenths_sec),
                     time_text_size, time_text_color)
    canvas.draw_text(format_score(), score_pos(
        format_score()), score_text_size, score_text_color)


# create frame
frame = simplegui.create_frame("Stop Watch", width, height)
frame.set_draw_handler(draw)


# register event handlers
timer = simplegui.create_timer(100, tick)
start = frame.add_button("Start", start_button, 100)
stop = frame.add_button("Stop", stop_button, 100)
reset = frame.add_button("Reset", reset_button, 100)


# start frame
frame.start()
timer.start()
# Please remember to review the grading rubric


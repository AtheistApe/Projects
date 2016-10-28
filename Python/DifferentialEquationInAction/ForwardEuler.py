import math
import numpy
import scipy
import matplotlib.pyplot

def forward_euler():
    h = 0.1 # s
    g = 9.81 # m / s2

    num_steps = 50

    t = numpy.zeros(num_steps + 1)
    x = numpy.zeros(num_steps + 1)
    v = numpy.zeros(num_steps + 1)
    x[0] = 5.0
    v[0] = 20.0

    for step in range(num_steps):
        t[step + 1] = t[step]+h
        x[step + 1] = x[step]+v[step]*h
        v[step + 1] = v[step]-9.81*h
    return t, x, v

t, x, v = forward_euler()

#@show_plot # Remove this line when running locally
def plot_me():
    axes_height = matplotlib.pyplot.subplot(211)
    matplotlib.pyplot.plot(t, x)
    axes_velocity = matplotlib.pyplot.subplot(212)
    matplotlib.pyplot.plot(t, v)
    axes_height.set_ylabel('Height in m')
    axes_velocity.set_ylabel('Velocity in m/s')
    axes_velocity.set_xlabel('Time in s')
    # Uncomment the line below when running locally.
    matplotlib.pyplot.show() 

plot_me()

from __future__ import print_function
from __future__ import division

import math


class Shape(object):

    def __init__(self, position):
        self.position = position


class Circle(Shape):

    def __init__(self, radius, center):
        self.radius = radius
        super(Circle, self).__init__(center)

    def circumference(self):
        return 2.0 * math.pi * self.radius

    def area(self):
        return math.pi * self.radius ** 2

    def point_inside(self, xy):
        dist_x = xy[0] - self.position[0]
        dist_y = xy[1] - self.position[1]

        dist = math.hypot(dist_x, dist_y)

        if dist < self.radius:
            return True
        else:
            return False


c1 = Circle(3.0, (0.5, 1.0))
c2 = Circle(1.5, (-0.5, 2.0))
c3 = Circle(0.5, (0, 0))

print(c3.point_inside((0.2, 0.4)))

print(c2.radius, c2.circumference())

print(c1.position)

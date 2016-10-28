class WorldMap(object):

    """The game world"""

    def __init__(self, width, height):
        self.width = width
        self.height = height
        self.map = [[None for x in range(self.width)]
                    for y in range(self.height)]

    def is_occupied(self, x, y):
        '''Checks if a given space on the map and returns True if occupied.'''
        return self.map[x][y] is not None


class Entity(object):

    """Entities occupy locations"""

    def __init__(self, x, y):
        if world.is_occupied(x, y):
            print("Oops, there is something here already")
        else:
            self.set_position(x, y)

    def set_position(self, x, y):
        self.x = x
        self.y = y
        world.map[x][y] = self

    def remove(self):
        world.map[self.x][self.y] = None

    def dist(self, other):
        return [abs(self.x - other.x), abs(self.y - other.y)]


class Character(Entity):

    """Base character class"""

    def __init__(self, x, y, hp):
        Entity.__init__(self, x, y)
        self.hp = hp
        self.items = []

    def move_left(self):
        self.x -= 1

    def move_right(self):
        self.x += 1

    # the character can only attack an enemy (another instance of Character)
    # if it is one square away.
    def attack(self, enemy):
        if self.dist(enemy)[0] == 1 and self.dist(enemy)[1] == 0:
            enemy.hp -= 10
        else:
            print('Enemy out of range')


class Enemy(Character):

    """Enemy base class"""

    def __init__(self, x, y, hp):
        Character.__init__(self, x, y, hp)

    def challenge(self, other):
        print("Let's fight!")


class Wizard(Character):

    """Base class for Wizards"""

    def __init__(self, x, y, hp):
        Character.__init__(self, x, y, hp)

    def cast_spell(self, enemy):
        if self.dist(enemy)[0] == 1 and self.dist(enemy)[1] == 0:
            enemy.remove()


class Archer(Character):

    """Base class for Archers"""

    def __init__(self, x, y, hp):
        Character.__init__(self, x, y, hp)

    def range_attack(self, enemy):
        if self.dist(enemy)[0] <= 5 and self.dist(enemy)[1] == 0:
            enemy.hp -= 5
        else:
            print("Enemy out of range")


world = WorldMap(100, 100)

Alice = Enemy(0, 0, 100)
Alice.move_right()
Alice.move_right()
# print Alice.x, Alice.y, Alice.hp
Bob = Archer(4, 0, 100)
Joe = Wizard(9, 0, 200)
print Alice.dist(Bob)
print Alice.dist(Joe)
Bob.range_attack(Alice)
Bob.range_attack(Alice)
print Alice.x, Alice.y, Alice.hp
Bob.range_attack(Joe)

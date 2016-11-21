# Jumpy! - Platform game

import pygame as pg
import random
import os
from settings import *
from sprites import *

class Game:
    def __init__(self):
        # Initialize game window, etc...
        self.running = True
        pg.init()
        pg.mixer.init()
        self.screen = pg.display.set_mode((WIDTH, HEIGHT))
        pg.display.set_caption(TITLE)
        self.clock = pg.time.Clock()

    def new(self):
        # Start a new game
        self.all_sprites = pg.sprite.Group()
        self.platforms = pg.sprite.Group() # For collison detection
        self.player = Player()
        self.all_sprites.add(self.player)
        p1 = Platform(0, HEIGHT - 40, WIDTH, 40)
        p2 = Platform(WIDTH / 2 - 50, HEIGHT * 3/4, 100, 20)
        self.all_sprites.add(p1, p2)
        self.platforms.add(p1, p2)
        self.run()

    def run(self):
        # The game loop
        self.playing = True
        while self.playing:
            self.clock.tick(FPS)
            self.events()
            self.update()
            self.draw()

    def update(self):
        # Game loop - update
        self.all_sprites.update() # Update all sprites in the sprite group
        hits = pg.sprite.spritecollide(self.player, self.platforms, False)
        if hits:
            self.player.pos.y = hits[0].rect.top
            self.player.vel.y = 0

    def events(self):
        # Game loop - events
        for event in pg.event.get():
            # Check for closing the window
            if event.type == pg.QUIT:
                if self.playing:
                    self.playing = False
                self.running = False

    def draw(self):
        # Game loop - draw
        self.screen.fill(BLACK)
        self.all_sprites.draw(self.screen) # Draw all sprites in the sprite group

        # *after* drawing everything, flip the display
        pg.display.flip()

    def show_start_screen(self):
        # Game splash/start screen
        pass

    def show_go_screen(self):
        # Game over/continue screen
        pass

g = Game()
g.show_start_screen()

while g.running:
    g.new()
    g.show_go_screen

pg.quit()

# Sprite classes for platform game.
import pygame as pg
from settings import *
vec = pg.math.Vector2 # 2-dim vector class in Pygame

class Player(pg.sprite.Sprite):
    def __init__(self, game):
        pg.sprite.Sprite.__init__(self)
        self.game = game # Player object 'knows' about all objects in game class.
        self.image = pg.Surface((30, 40))
        self.image.fill(YELLOW)
        self.rect = self.image.get_rect()
        self.pos = vec(WIDTH/2, HEIGHT/2)
        # self.rect.center = self.pos
        self.rect.midbottom = self.pos
        self.vel = vec(0, 0)
        self.acc = vec(0, 0)

    def jump(self):
        # Jump only if standing on a platform.
        self.rect.y += 1 # To make player collision with platform if standing on it.
        hits = pg.sprite.spritecollide(self, self.game.platforms, False)
        self.rect.y -= 1 # Move player up again so not colliding with platform.
        if hits:
            self.vel.y = -PLAYER_JUMP

    def update(self):
        self.acc = vec(0, PLAYER_GRAV)
        keys = pg.key.get_pressed()
        if keys[pg.K_LEFT]:
            self.acc.x = -1*PLAYER_ACC
        if keys[pg.K_RIGHT]:
            self.acc.x = PLAYER_ACC
        # if keys[pg.K_j]:
        #     self.jump()

        # Apply friction
        self.acc.x += self.vel.x * PLAYER_FRICTION
        # Equations of motion
        self.vel += self.acc
        self.pos += self.vel + 0.5 * self.acc
        # Wrap around the sides of the screen
        if self.pos.x > WIDTH:
            self.pos.x = 0
        if self.pos.x < 0:
            self.pos.x = WIDTH

        self.rect.midbottom = self.pos

class Platform(pg.sprite.Sprite):
    def __init__(self, x, y, w, h):
        pg.sprite.Sprite.__init__(self)
        self.image = pg.Surface((w, h))
        self.image.fill(GREEN)
        self.rect = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y

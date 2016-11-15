# Pygame template - skeleton for a new pygame program

# Good source for free art is 'opengameart.org'. Search
# for 'kenney' -- he as some great stuff you can use.

# The website 'www.bfxr.net' is a great place to create
# your own sound effects.

import pygame
import random
import os

WIDTH = 360
HEIGHT = 480
FPS = 30

WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
RED = (255, 0, 0)
GREEN = (0, 255, 0)
BLUE = (0, 0, 255)
YELLOW = (255, 255, 0)
MAGENTA = (255, 0, 255)
CYAN = (0, 255, 255)

# Set up assets (images, sounds, etc...) folders
# Note: '__file__' gives the path of the current file
game_folder = os.path.dirname(__file__)
img_folder = os.path.join(game_folder, "img")
snd_folder = os.path.join(game_folder, "snd")

# Initialize pygame and create window
pygame.init()
pygame.mixer.init()
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("My Game")
clock = pygame.time.Clock()

all_sprites = pygame.sprite.Group()

# Game loop
running = True
while running:
    # Keep running at the right speed
    clock.tick(FPS)
    # Process input (events)
    for event in pygame.event.get():
        # Check for closing the window
        if event.type == pygame.QUIT:
            running = False

    # Update
    all_sprites.update() # Update all sprites in the sprite group

    # Draw / render
    screen.fill(BLACK)
    all_sprites.draw(screen) # Draw all sprites in the sprite group

    # *after* drawing everything, flip the display
    pygame.display.flip()

pygame.quit()

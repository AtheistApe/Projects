// Ex05_02: 'perlan noise' randomness.

/* Returns the Perlin noise value at specified coordinates.
Perlin noise is a random sequence generator producing a more
natural, harmonic succession of numbers than that of the
standard random() function. It was developed by Ken Perlin
in the 1980s and has been used in graphical applications to
generate procedural textures, shapes, terrains, and other
seemingly organic forms.
*/


int n = 100;
int x;
float y = 0.05;
float noiseY;

size(600, 200);
background(255);
stroke(100);

for(int i = 1; i < n; i++) {
  y += 0.02;
  x = i * (width/n);
  noiseY = noise(y) * height;
  line(x, height, x, noiseY);
}

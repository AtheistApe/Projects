// Ex05_09: Manipulating the grid.

color[] chemistry = {#0c2550, #a3d0c1, #fdf6dd, #fee406, #f4651c};
color[] palette = chemistry;

int s = 80;
int d = 10;

size(600, 200);
smooth();
noStroke();
background(palette[0]);

fill(palette[1]);
rect(0, 0, s, s);
fill(palette[4]);
ellipse(0, 0, d, d);

// Translate origin of grid
translate(40, 90);
fill(palette[2]);
rect(0, 0, s, s);
fill(palette[4]);
ellipse(0, 0, d, d);

// Scale the grid
translate(140, -70); // from current location
scale(2); // scale grid by a factor of 2.
fill(palette[3]);
rect(0, 0, s, s);
scale(0.5); // scale by 0.5, undoing the previous scaling.
fill(palette[4]);
ellipse(0, 0, d, d);

// Rotate the grid
translate(280, 10); // from current location
scale(1.33); // scale grid by a factor of 1.33.
rotate(PI*0.25); // rotate grid clockwise about current origin
/* Can also use:
    rotate(radians(90));
  for the same effect */
fill(palette[1]);
rect(0, 0, s, s);
scale(1/1.33);
fill(palette[4]);
ellipse(0, 0, d, d);

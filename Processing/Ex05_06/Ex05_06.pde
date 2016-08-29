// Ex05_06: Color attributes and functions

size(600, 200);
smooth();
noStroke();
rectMode(CENTER);
background(50); // grayscale 0-255: 0 = black, 255 = white

int n = 4; // number of rectangles
float x = width / (n+1);

fill(116);
rect(x*1, height/2, 100, 100);

fill(116, 100); /* second parameter is alpha 0-255:
0 = completly transparent, 255 = completly opaque. */
rect(x*2, height/2, 100, 100);

fill(116, 173, 146); /* with three parameters, now working in
RGB color system where inputs are R, G, B values 0-255. */
rect(x*3, height/2, 100, 100);

fill(116, 173, 146, 100); /* with four parameters, now working in
RGB color system where inputs are R, G, B and alpha values 0-255. */
rect(x*4, height/2, 100, 100);

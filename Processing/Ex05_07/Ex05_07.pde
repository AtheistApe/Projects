// Ex05_07: Color spaces

size(600, 200);
smooth();
noStroke();
background(50);
rectMode(CENTER);

int n = 4;
float x = width/(n+1);

colorMode(RGB); // Default color mode.
fill(116, 173, 146); // RGB Mode. Each R,G,B from 0-255.
rect(x*1, height/2, 100, 100);

fill(#74ad92); /* RGB Mode, HEX form. each pair of hex
values represents an R,G,B channel. Here #74 is R, #ad is G
and #92 is B. */
rect(x*2, height/2, 100, 100);

colorMode(HSB, 360, 100, 100); /* The numbers after 'HSB'
give the range of values (from 0) for the hue (H),
saturation (S) and brightness (B). */
fill(151, 32, 67); // values determined from the 'Color Selector'
rect(x*3, height/2, 100, 100);

/* 'Color Selector Plus' seems to be incompatible with
processing 3. */

colorMode(HSB, 360, 255, 255);
fill(151, 84, 173);
rect(x*4, height/2, 100, 100);

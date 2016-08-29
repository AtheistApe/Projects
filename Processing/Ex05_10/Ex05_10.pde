/* Ex05_10: Saving and recalling changes to drawings
with 'pushMatrix', 'popMatrix', 'pushStyle' and
'popStyle' */

color[] crowds = {#678c8b, #8fa89b, #a2bab0, #d0edde, #b38597};
color[] palette = crowds;

int s = 80;

size(600, 200);
smooth();
noStroke();
background(palette[0]);

fill(palette[1]);
rect(0, 0, s, s);

/* Save current, unaltered state */
pushMatrix();
pushStyle();

/* Make changes to canvas, changing state */
translate(230, 25);
scale(2);
rotate(radians(45));
stroke(palette[3]);
strokeWeight(15);
fill(palette[2]);
rect(0, 0, s, s);

/* Recall default transformation matrix (translation,
scaling and rotation). Style information is unaffected. */
popMatrix();
rect(380, 20, s, s);

/* Recall default style state */
popStyle();
rect(width-s, height-s, s, s);

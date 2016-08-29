// Ex06_05: Object follows mouse with lag.

/* Three rings chasing a circle, where the rings follow
with some lag behind the circle. */

color[] minard = {#666666, #607F9C, #E9CCAE, #FFFFF3, #D01312};
color[] palette = minard;

/* Set up "easing" functionality to allow lag */
int wide = 600; // Width of window
int high = 200; // Height of window

int d = 20; // Diameter of ellipse

/* Variables for ring 1:
  x1, y1: the (x, y) coords of the center of ring 1
  easing1: the degree of lag of ring 1
*/
float x1 = random(wide);
float y1 = random(high);
float easing1 = 0.01;

/* Variables for ring 2:
  x2, y2: the (x, y) coords of the center of ring 2
  easing2: the degree of lag of ring 2
*/
float x2 = random(wide);
float y2 = random(high);
float easing2 = 0.03;

/* Variables for ring 3:
  x3, y3: the (x, y) coords of the center of ring 3
  easing3: the degree of lag of ring 3
*/
float x3 = random(wide);
float y3 = random(high);
float easing3 = 0.05;

void settings() {
  size(wide, high);
}

void setup() {
  smooth();
  strokeWeight(3);
  frameRate(1);
  // cursor(ARROW); // Default
  // cursor(CROSS);
  // cursor(HAND);
  // cursor(TEXT);
  // cursor(WAIT);
  noCursor(); // Don't display cursor on canvas
}

void draw() {
  background(palette[0]);

  // Circle 1
  stroke(palette[1]);
  noFill();
  ellipse(x1, y1, d+15, d+15);
  x1 += (mouseX - x1)*easing1;
  y1 += (mouseY - y1)*easing1;

  // Circle 2
  stroke(palette[2]);
  noFill();
  ellipse(x2, y2, d+10, d+10);
  x2 += (mouseX - x2)*easing2;
  y2 += (mouseY - y2)*easing2;

  // Circle 3
  stroke(palette[3]);
  noFill();
  ellipse(x3, y3, d+5, d+5);
  x3 += (mouseX - x3)*easing3;
  y3 += (mouseY - y3)*easing3;

  // Dot on cursor
  noStroke();
  fill(palette[4]);
  ellipse(mouseX, mouseY, d, d);
}

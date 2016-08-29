// Ex06_01: Putting code into blocks.

color[] styleyou = {#262B30, #E09A25, #F0D770, #F2EDBC, #C51C30};
color[] palette = styleyou;

// Global variables
int i = 1;
int x = 0;

void setup() {
  size(600, 200);
  smooth();
  stroke(palette[4]);
  strokeWeight(5);
}

void draw() {
  background(palette[0]);
  fill(palette[i]);
  rect(x, 75, 50, 50);
}

void keyPressed() {
  x += 3;
}

void mousePressed() {
  i = int(random(1, 5));
}

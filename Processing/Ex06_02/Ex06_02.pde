// Ex06_02: While loops.

color[] dessert = {#9F9694, #791F33, #BA3D49, #F1E6D4, #E2E1DC};
color[] palette = dessert;

float limiter = 0;

void setup() {
  size(600, 200);
  background(palette[0]);
  smooth();
  strokeWeight(5);
  noFill();
  frameRate(5);
}

void draw() {
  while(limiter < 100) {
    stroke(palette[int(random(1, 5))]);
    float x = random(width);
    float y = random(height);
    float d = random(20, 200);
    ellipse(x, y, d, d);
    limiter += random(-1, +2);
  }
}

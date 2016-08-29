// Ex10_01: Embedding data into a sketch

color[] dessert = {#9F9694, #791F33, #BA3D49, #F1E6D4, #E2E1DC};
color[] palette = dessert;

size(600, 200);
background(palette[0]);
smooth();

int[] fibonacci = {0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377};

for(int i = 0; i < fibonacci.length; i++) {
  // noStroke();
  // fill(palette[2], 50);
  stroke(palette[1]);
  // strokeWeight(2);
  float x = fibonacci[i];
  // ellipse(x, height/2, 20, 20);
  line(x, 75, x, 125);
}

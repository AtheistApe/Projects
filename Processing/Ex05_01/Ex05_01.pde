// Ex05_01: The 'random' function

color[] rainbow = {#ffffcd, #cc5c54, #f69162, #85a562, #7ab5db};
void setup() {
  size(600, 200);
  smooth();
  noFill();
  strokeWeight(5);
  frameRate(5); // sets the # frames/sec draw loop executes.
  background(rainbow[0]);
}

void draw() {
  float x = random(width); // 'width' is the width of the current window.
  float y = random(height); // 'height' is the height of the current window.
  float d = random(30, 300);
  // stroke(random(255), random(255), random(255));
  stroke(rainbow[int(random(1,5))]);
  ellipse(x, y, d, d);
}

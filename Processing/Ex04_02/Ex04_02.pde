// Ex04_02

// There are global variables
int x = 0;
int y = 50;
int z;

void setup() {
  size(600, 200);
  smooth();
  // This is a local variable
  color  darkGray = #333333;
  background(darkGray);
  println("darkGray = #" + hex(darkGray, 6));
  float randomFloat1 = random(10);
  println("randomFloat1 = " + randomFloat1);
  z = 25;
}

void draw() {
  color darkGray = #111111;
  background(darkGray);
}
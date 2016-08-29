// Ex04_03

int x = 10;
float y = 50;
float z;

void setup() {
  size(600, 200);
  smooth();
  noStroke();
  
  // Assign a new value to an existing variable
  y = height; // "height", "width" are built in variables for the height and width of the window
  
  // Casting a variable
  float randomFloat = random(10);
  println("randomFloat = " + randomFloat);
  
  int randomInt = int(random(11));
  println("randomInt = " + randomInt);
  
  int randomDie = int(random(11)) + 1;
  println("randomDie = " + randomDie);
  
  z = 3*x + atan(sqrt(y));
  println("z = " + z);
}

void draw() {
  background(#333333);
  ellipse(x, y, 40, 40);
  
  x++;
  y *= 0.99;
  
  x = constrain(x, 0, width/2);
}
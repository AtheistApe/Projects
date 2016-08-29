float inc = 0.01;
float start = 0;

void setup() {
  size(400,400);
}

void draw() {
  background(51);
  beginShape();
    float xoff = start;
    for (int x=0; x < width; x++) {
      stroke(255);
      noFill();
      //y = random(height);
      float y = noise(xoff)*height;
      vertex(x, y);
      
      xoff += inc;
    }
   endShape();
   start += inc;
   //noLoop();
}
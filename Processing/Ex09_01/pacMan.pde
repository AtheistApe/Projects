// Define the pacMan() function

void pacMan() {
  noStroke();
  
  float x = random(width);
  float y = random(height);
  float d = random(20, 100);

  fill(#FFEF00); // Bright yellow
  arc(x, y, d, d, PI*0.2, PI*1.8);
}

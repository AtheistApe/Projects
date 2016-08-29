import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Ex06_02 extends PApplet {

// Ex06_02: While loops.

int[] dessert = {0xff9F9694, 0xff791F33, 0xffBA3D49, 0xffF1E6D4, 0xffE2E1DC};
int[] palette = dessert;

float limiter = 0;

public void setup() {
  
  background(palette[0]);
  
  strokeWeight(5);
  noFill();
  frameRate(5);
}

public void draw() {
  while(limiter < 100) {
    stroke(palette[PApplet.parseInt(random(1, 5))]);
    float x = random(width);
    float y = random(height);
    float d = random(20, 200);
    ellipse(x, y, d, d);
    limiter += random(-1, +2);
  }
}
  public void settings() {  size(600, 200);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex06_02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

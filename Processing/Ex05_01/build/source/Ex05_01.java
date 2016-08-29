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

public class Ex05_01 extends PApplet {

// Ex05_01: The 'random' function

int[] rainbow = {0xffffffcd, 0xffcc5c54, 0xfff69162, 0xff85a562, 0xff7ab5db};
public void setup() {
  
  
  noFill();
  strokeWeight(5);
  frameRate(5); // sets the # frames/sec draw loop executes.
  background(rainbow[0]);
}

public void draw() {
  float x = random(width); // 'width' is the width of the current window.
  float y = random(height); // 'height' is the height of the current window.
  float d = random(30, 300);
  // stroke(random(255), random(255), random(255));
  stroke(rainbow[PApplet.parseInt(random(1,5))]);
  ellipse(x, y, d, d);
}
  public void settings() {  size(600, 200);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex05_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

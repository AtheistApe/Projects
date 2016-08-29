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

public class Ex07_01 extends PApplet {

// Ex07_01: Using the mouse in drawings.

public void setup() {
  
  
  frameRate(8);
  background(255); // Bright white.
}

public void draw() {
  noStroke();
  fill(220, 0, 0);
  ellipse(mouseX, mouseY, 10, 10);
  fill(120);
  ellipse(pmouseX, pmouseY, 10, 10);
  stroke(120);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

public void mousePressed() {
  background(255);
}
  public void settings() {  size(600, 200);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex07_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

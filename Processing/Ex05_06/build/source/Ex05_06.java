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

public class Ex05_06 extends PApplet {
  public void setup() {
// Ex05_06: Color attributes and functions



noStroke();
rectMode(CENTER);
background(50); // grayscale 0-255: 0 = black, 255 = white

int n = 4; // number of rectangles
float x = width / (n+1);

fill(116);
rect(x*1, height/2, 100, 100);

fill(116, 100); /* second parameter is alpha 0-255:
0 = completly transparent, 255 = not at all transparent. */
rect(x*2, height/2, 100, 100);
    noLoop();
  }

  public void settings() { 
size(600, 200); 
smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex05_06" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

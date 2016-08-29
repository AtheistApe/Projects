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

public class Ex05_09 extends PApplet {
  public void setup() {
// Ex05_09: Manipulating the grid.

int[] chemistry = {0xff0c2550, 0xffa3d0c1, 0xfffdf6dd, 0xfffee406, 0xfff4651c};
int[] palette = chemistry;

int s = 80;
int d = 10;



noStroke();
background(palette[0]);

fill(palette[1]);
rect(0, 0, s, s);
fill(palette[4]);
ellipse(0, 0, d, d);

// Translate origin of grid
translate(40, 90);
fill(palette[2]);
rect(0, 0, s, s);
fill(palette[4]);
ellipse(0, 0, d, d);

// Scale the grid
translate(140, -70); // from current location
scale(2); // scale grid by a factor of 2.
fill(palette[3]);
rect(0, 0, s, s);
scale(0.5f); // scale by 0.5, undoing the previous scaling.
fill(palette[4]);
ellipse(0, 0, d, d);

// Rotate the grid
translate(280, 10); // from current location
scale(1.33f); // scale grid by a factor of 1.33.
rotate(PI*0.25f); // rotate grid clockwise about current origin
/* Can also use:
    rotate(radians(90));
  for the same effect */
fill(palette[1]);
rect(0, 0, s, s);
scale(1/1.33f);
fill(palette[4]);
ellipse(0, 0, d, d);
    noLoop();
  }

  public void settings() { 
size(600, 200); 
smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex05_09" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

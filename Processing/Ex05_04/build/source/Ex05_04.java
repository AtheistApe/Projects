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

public class Ex05_04 extends PApplet {
  public void setup() {
// Ex05_04: Modifying how lines, circles and rectangles are drawn.

int[] rainbow = {0xffffffcd, 0xffcc5c54, 0xfff69162, 0xff85a562, 0xff7ab5db};


background(rainbow[0]);
// smooth(); // turns anti-aliasing on. 'noSmooth' turns it off.

strokeWeight(20);
stroke(rainbow[1]);

// strokeCap(ROUND); // default value
// line(50, height*0.25, 550, height*0.25);
//
// strokeCap(SQUARE); // square ends
// line(50, height*0.5, 550, height*0.5);
//
// strokeCap(PROJECT); // line same length as 'ROUND' caped lines.
// line(50, height*0.75, 550, height*0.75);

noFill();
strokeJoin(MITER); // default value
rect(50, 50, 100, 100);

strokeJoin(BEVEL); // beveled corners
rect(200, 50, 100, 100);

strokeJoin(ROUND); // rounded corners
rect(350, 50, 100, 100);
    noLoop();
  }

  public void settings() { 
size(600, 200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex05_04" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

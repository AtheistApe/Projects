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

public class Ex05_05 extends PApplet {
  public void setup() {
// Ex05_05: positioning shapes



strokeWeight(20);

// Rectangles

// rectMode(CORNER); // default placement from top left corner.
// stroke(#ff0000); // red
// rect(250, 50, 100, 100);
//
// rectMode(CENTER); // place with center at given coordinates
// stroke(#00ff00); // green
// rect(150, 100, 100, 100);
//
// rectMode(CORNERS); // x-y coords for top left and bottom right corners, resp.
// stroke(#0000ff); // blue
// rect(400, 50, 500, 150);

// Ellipses

noFill();
ellipseMode(CENTER); // default mode
stroke(0xffff0000); // red
ellipse(width/2, height/2, 100, 100); // center an ellipse on the canvas

ellipseMode(CORNER); /* position ellipse from upper left
corner of rectangular bounding box */
stroke(0xff0000ff); // blue
ellipse(width/2 - 125, height/2 - 50, 100, 100);

ellipseMode(CORNERS); /* define x-y coords of top left and bottom right
corners of rectangular bounding box of the ellipse */
stroke(0xff00ff00); // green
ellipse(325, 50, 425, 150); /* position ellipse from upper left
corner of rectangular bounding box */
    noLoop();
  }

  public void settings() { 
size(600, 200); 
smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex05_05" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

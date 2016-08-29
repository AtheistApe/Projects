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

public class Ex08_02 extends PApplet {
  public void setup() {
// Ex08_02: Using images in sketches



PImage spaceInvader;
spaceInvader = loadImage("SpaceInvaderRed.jpg");
// image(spaceInvader, 0, 0, 200, 150); /* Parameters after
// image are location (x, y) and size (width, height).
// Leaving off the size parameters imports image with
// default size (no rescaling) */
image(spaceInvader, 0, 0);
filter(BLUR, 3); // Filter must come after thing it is applied to.

// Importing an image from the web
PImage webInvader;
String url = "http://farm3.staticflickr.com/2397/2148858093_0b469eeb97.jpg";
webInvader = loadImage(url);
image(webInvader, 300, 0, 300, 200); // Had to rescale to make it fit
filter(GRAY);
    noLoop();
  }

  public void settings() { 
size(600, 200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex08_02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

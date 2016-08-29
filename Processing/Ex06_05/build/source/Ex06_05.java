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

public class Ex06_05 extends PApplet {

// Ex06_05: Object follows mouse with lag.

/* Three rings chasing a circle, where the rings follow
with some lag behind the circle. */

int[] minard = {0xff666666, 0xff607F9C, 0xffE9CCAE, 0xffFFFFF3, 0xffD01312};
int[] palette = minard;

/* Set up "easing" functionality to allow lag */
int wide = 600; // Width of window
int high = 200; // Height of window

int d = 20; // Diameter of ellipse

/* Variables for ring 1:
  x1, y1: the (x, y) coords of the center of ring 1
  easing1: the degree of lag of ring 1
*/
float x1 = random(wide);
float y1 = random(high);
float easing1 = 0.01f;

/* Variables for ring 2:
  x2, y2: the (x, y) coords of the center of ring 2
  easing2: the degree of lag of ring 2
*/
float x2 = random(wide);
float y2 = random(high);
float easing2 = 0.03f;

/* Variables for ring 3:
  x3, y3: the (x, y) coords of the center of ring 3
  easing3: the degree of lag of ring 3
*/
float x3 = random(wide);
float y3 = random(high);
float easing3 = 0.5f;

public void settings() {
  size(wide, high);
}

public void setup() {
  
  strokeWeight(3);
  frameRate(1);
  // cursor(ARROW); // Default
  // cursor(CROSS);
  // cursor(HAND);
  // cursor(TEXT);
  // cursor(WAIT);
  noCursor(); // Don't display cursor on canvas
}

public void draw() {
  background(palette[0]);

  // Circle 1
  stroke(palette[1]);
  noFill();
  ellipse(x1, y1, d+15, d+15);
  x1 += (mouseX - x1)*easing1;
  y1 += (mouseY - y1)*easing1;

  // Circle 2
  stroke(palette[2]);
  noFill();
  ellipse(x2, y2, d+10, d+10);
  x2 += (mouseX - x2)*easing2;
  y2 += (mouseY - y2)*easing2;

  // Circle 3
  stroke(palette[3]);
  noFill();
  ellipse(x3, y3, d+5, d+5);
  x3 += (mouseX - x3)*easing3;
  y3 += (mouseY - y3)*easing3;

  // Dot on cursor
  noStroke();
  fill(palette[4]);
  ellipse(mouseX, mouseY, d, d);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex06_05" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

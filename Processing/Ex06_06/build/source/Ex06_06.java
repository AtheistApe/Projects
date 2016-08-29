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

public class Ex06_06 extends PApplet {
  public void setup() {
// Ex06_06: Creating spirals

int[] dessert = {0xff9F9694, 0xff791F33, 0xffBA3D49, 0xffF1E6D4, 0xffE2E1DC};
int[] palette = dessert;

float x, y;
float radiusCircle = 100;


translate(width/2, height/2);
background(palette[0]);


// // Draw a circle using "ellipse"
// ellipseMode(RADIUS);
// stroke(palette[1]);
// noFill();
// ellipse(0, 0, radiusCircle, radiusCircle);

// // Draw a circle with points
// stroke(palette[4]);
// strokeWeight(5);
//
// for(float angle = 0; angle < 2*PI; angle += 0.1) {
//   x = cos(angle) * radiusCircle;
//   y = sin(angle) * radiusCircle;
//   point(x, y);
// }


// // Draw a spiral with points
// float radiusSpiralDots = 10;
// stroke(palette[3]);
// strokeWeight(5);
//
// for(float angle = 0; angle < 8*PI; angle += 0.1) {
//   radiusSpiralDots += 0.5;
//   x = cos(angle) * radiusSpiralDots;
//   y = sin(angle) * radiusSpiralDots;
//   point(x, y);
// }

// Draw a spiral curve

float px = -999;
float py = -999;
float radiusSpiralLine = 10;
stroke(palette[2]);
strokeWeight(1);

for(float angle = 0; angle < 8*PI; angle += 0.05f) {
  radiusSpiralLine += 0.25f;
  x = cos(angle) * radiusSpiralLine;
  y = sin(angle) * radiusSpiralLine;
  if( px > -999 ) {
    line(x, y, px, py);
  }
  px = x;
  py = y;
  point(x, y);
}
    noLoop();
  }

  public void settings() { 
size(400, 400); 
smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex06_06" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

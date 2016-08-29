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

public class Ex05_10 extends PApplet {
  public void setup() {
/* Ex05_10: Saving and recalling changes to drawings
with 'pushMatrix', 'popMatrix', 'pushStyle' and
'popStyle' */

int[] crowds = {0xff678c8b, 0xff8fa89b, 0xffa2bab0, 0xffd0edde, 0xffb38597};
int[] palette = crowds;

int s = 80;



noStroke();
background(palette[0]);

fill(palette[1]);
rect(0, 0, s, s);

/* Save current, unaltered state */
pushMatrix();
pushStyle();

/* Make changes to canvas, changing state */
translate(230, 25);
scale(2);
rotate(radians(45));
stroke(palette[3]);
strokeWeight(15);
fill(palette[2]);
rect(0, 0, s, s);

/* Recall default transformation matrix (translation,
scaling and rotation). Style information is unaffected. */
popMatrix();
rect(380, 20, s, s);

/* Recall default style state */
popStyle();
rect(width-s, height-s, s, s);
    noLoop();
  }

  public void settings() { 
size(600, 200); 
smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex05_10" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

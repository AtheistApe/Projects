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

public class Ex05_08 extends PApplet {
  public void setup() {
// Ex05_08: Color palettes.

/*
  Some resources:
  http://www.colorbrewer2.org
  http://www.colorschemedesigner.com
  **http://kuler.adobe.com
*/

/* Create an array of color hex values as a color palette. */
int[] backstage = {0xff828594, 0xff614b59, 0xffbfc47d, 0xffe3e2b3, 0xffadaca2};
int[] palette = backstage;



noStroke();

background(palette[0]);

fill(palette[1]);
ellipse(120, height/2, 100, 100);

fill(palette[2]);
ellipse(240, height/2, 100, 100);

fill(palette[3]);
ellipse(360, height/2, 100, 100);

fill(palette[4]);
ellipse(480, height/2, 100, 100);
    noLoop();
  }

  public void settings() { 
size(600, 200); 
smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex05_08" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

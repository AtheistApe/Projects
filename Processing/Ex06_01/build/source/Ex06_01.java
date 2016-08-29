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

public class Ex06_01 extends PApplet {

// Ex06_01: Putting code into blocks.

int[] styleyou = {0xff262B30, 0xffE09A25, 0xffF0D770, 0xffF2EDBC, 0xffC51C30};
int[] palette = styleyou;

// Global variables
int i = 1;
int x = 0;

public void setup() {
  
  
  stroke(palette[4]);
  strokeWeight(5);
}

public void draw() {
  background(palette[0]);
  fill(palette[i]);
  rect(x, 75, 50, 50);
}

public void keyPressed() {
  x += 3;
}

public void mousePressed() {
  i = PApplet.parseInt(random(1, 5));
}
  public void settings() {  size(600, 200);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex06_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

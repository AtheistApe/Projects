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

public class Ex10_01 extends PApplet {
  public void setup() {
// Ex10_01: Embedding data into a sketch

int[] dessert = {0xff9F9694, 0xff791F33, 0xffBA3D49, 0xffF1E6D4, 0xffE2E1DC};
int[] palette = dessert;


background(palette[0]);


int[] fibonacci = {0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377};

for(int i = 0; i < fibonacci.length; i++) {
  // noStroke();
  // fill(palette[2], 50);
  stroke(palette[1]);
  // strokeWeight(2);
  float x = fibonacci[i];
  // ellipse(x, height/2, 20, 20);
  line(x, 75, x, 125);
}
    noLoop();
  }

  public void settings() { 
size(600, 200); 
smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex10_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

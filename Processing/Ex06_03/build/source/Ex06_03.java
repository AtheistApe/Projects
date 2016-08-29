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

public class Ex06_03 extends PApplet {

// Ex06_03: For loops

int[] beach = {0xffD9C6B0, 0xff314650, 0xff2D4761, 0xff45718C, 0xffB6E1F2};
int[] palette = beach;

int s = 50;

public void setup() {
  
  background(palette[0]);
  
  noStroke();
  // frameRate(2);

  for(int x = 0; x < width; x += s){
    for(int y = 0; y < height; y += s){
      fill(palette[PApplet.parseInt(random(1, 5))]);
      rect(x, y, s, s);
    }
  }
}

public void draw() {
  fill(palette[PApplet.parseInt(random(1, 5))]);
  int x = PApplet.parseInt(random(width/s))*s;
  int y = PApplet.parseInt(random(height/s))*s;
  rect(x, y, s, s);
}
  public void settings() {  size(600, 200);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex06_03" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

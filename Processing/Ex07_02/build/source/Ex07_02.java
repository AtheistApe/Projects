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

public class Ex07_02 extends PApplet {

// Ex07_02: More mouse interactions

int[] cottage = {0xffC3CCC8, 0xff442412, 0xff475D1C, 0xff859356, 0xffB9961C};
int[] palette = cottage;

int lf = palette[2];
int rf = palette[2];

int s = 120;

public void setup() {
  
  
  rectMode(CENTER);
  stroke(palette[1]);
  strokeWeight(5);
}

public void draw() {
  background(palette[0]);

  // Draw circle on left
  fill(lf);
  ellipse(width/3, height/2, s, s);

  // Draw square on right
  fill(rf);
  rect(width*2/3, height/2, s, s);

  // // Detect hovering over circle
  // if(dist(width/3, height/2, mouseX, mouseY) < s/2) {
  //   lf = palette[4];
  // } else {
  //   lf = palette[2];
  // }
  //
  // // Detect hovering over square
  // if((mouseX > width*2/3 - s/2) &&
  //   (mouseX < width*2/3 + s/2) &&
  //   (mouseY > height/2 - s/2) &&
  //   (mouseY < height/2 + s/2)) {
  //     rf = palette[4];
  //   } else {
  //     rf = palette[2];
  //   }

  // Detect clicking on circle
  if(dist(width/3, height/2, mouseX, mouseY) < s/2 && mousePressed) {
    lf = palette[4];
  } else {
    lf = palette[2];
  }

  // Detect clicking on square
  if((mouseX > width*2/3 - s/2) &&
    (mouseX < width*2/3 + s/2) &&
    (mouseY > height/2 - s/2) &&
    (mouseY < height/2 + s/2) && mousePressed) {
      rf = palette[4];
    } else {
      rf = palette[2];
    }
}
  public void settings() {  size(600, 200);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex07_02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

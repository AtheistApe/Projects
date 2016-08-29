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

public class Ex09_01 extends PApplet {

// Ex09_01: Functions

public void setup() {
  
  
  frameRate(2);
}

public void draw() {
  background(0);

  // pacMan();
  bar(1, 6, 150, "Region 1");
  bar(2, 6, 130, "Region 2");
  bar(3, 6, 122, "Region 3");
  bar(4, 6, 109, "Region 4");
  bar(5, 6, 87, "Region 5");
  bar(6, 6, 42, "Region 6");
}
// barGraph function

public void bar(int i, int n, int outcome, String label) {

  // Calculate the values for the bars
  int x = PApplet.parseInt(width*i/(n+1)); // Calculate x-coord for each bar
  int spaceBars = 20; // Sets space between bars in pixels
  float wide = (width - spaceBars*(n+1))/n;

  // Draw the bars
  rectMode(CENTER);
  noStroke();
  fill(200, 10, 10);
  rect(x, height-outcome/2, wide, outcome);

  // Draw the labels
  textAlign(CENTER);
  fill(200);
  text(label, x, height-outcome-10);
  fill(0);
  text(outcome, x, height-outcome+20);
}
// Define the pacMan() function

public void pacMan() {
  noStroke();
  
  float x = random(width);
  float y = random(height);
  float d = random(20, 100);

  fill(0xffFFEF00); // Bright yellow
  arc(x, y, d, d, PI*0.2f, PI*1.8f);
}
  public void settings() {  size(600, 200);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex09_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

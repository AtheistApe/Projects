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

public class Ex10_03 extends PApplet {

// Ex10_03: Reading tab separated spreadsheet files into sketches.

int[] rainbow = {0xffFFFFCD, 0xffCC5C54, 0xffF69162, 0xff85A562, 0xff7AB5DB};
int[] palette = rainbow;

Table stateData;
int rowCount;

public void setup() {
  
  stateData = loadTable("stateData.tsv");
  rowCount = stateData.getRowCount();
  println("rowCount = " + rowCount);
}

public void draw() {
  background(palette[0]);
  smooth();
  fill(palette[1], 160);
  noStroke();

  for (int row = 0; row < rowCount; row++) {
    String state = stateData.getString(row, 0);
    float age = stateData.getFloat(row, 4);
    float degree = stateData.getFloat(row, 3);
    ellipse(age*12, degree*3, 9, 9);
  }

  noLoop();
}
  public void settings() {  size(600, 200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex10_03" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

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

public class Ex08_01 extends PApplet {
  public void setup() {
// Ex08_01: Including text in a sketch

// // The basic version
// 
// background(0);
//
// String wordText = "A word is worth 1/1000th of a picture.";
// text(wordText, 50, height/2); // Position is baseline of text

// The elaborate version
size(600, 200);
background(0xff302F2F);

PFont sampleFont;
String wordText = "A word is worth 1/1000th of a picture.\n"
  + "something like that\n"
  + "and like this as well!";
sampleFont = loadFont("GillSansMT-20.vlw");
textFont(sampleFont);
fill(0xffFFE224);
textAlign(LEFT, CENTER);
textLeading(25);
text(wordText, 50, height/2); // Position is baseline of text
    noLoop();
  }

  public void settings() { 
size(600, 200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex08_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

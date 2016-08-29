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

public class Ex10_02 extends PApplet {

// Ex10_02: Integrating text data in sketches

int[] crowds = {0xff678C8B, 0xff8FA89B, 0xffA2BAB0, 0xffD0EDDE, 0xffB3B597};
int[] palette = crowds;
String[] presidents;

int i = 0;
int loop = 60*5;
int president = 1;

public void setup() {
  
  presidents = loadStrings("presidents.txt");
  PFont font;
  font = loadFont("Arial-BoldMT-48.vlw");
  textFont(font);
  println(presidents.length);
  println(presidents[45]);
  // frameRate(5);
}
// println(presidents);

public void draw() {
  background(palette[0]);
  fill(palette[2]);
  i++;
  if (i == 1){
    president++;
  }
  else if (i == 20){
    i = 0;
  }
  if (president >= presidents.length) {
    president = 1;
  }
  println(president);
  text(presidents[president], mouseX, mouseY);
}
  public void settings() {  size(750, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex10_02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

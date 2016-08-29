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

public class Ex06_04 extends PApplet {

// Ex06_04: Conditional statements
int[] rainbow = {0xffFFFFCD, 0xffCC5C54, 0xffF69162, 0xff85A562, 0xff7AB5DB};
int[] chemistry = {0xff0C2550, 0xffA3D0C1, 0xffFDF6DD, 0xffFEE406, 0xffF4651C};
int[] kitties = {0xff302F2F, 0xff74AD92, 0xffF07F47, 0xffFFAA42, 0xffFFE224};
int[] beach = {0xffD9C6B0, 0xff314650, 0xff2D4761, 0xff45718C, 0xffB6E1F2};
int[] cottage = {0xffC3CCC8, 0xff442412, 0xff475D1C, 0xff859356, 0xffB9961C};
int[] minard = {0xff666666, 0xff607F9C, 0xffE9CCAE, 0xffFFFFF3, 0xffD01312};
int[] palette = minard;

int choice;
int p1 = 1;
int p2 = 2;

float x;
float y;
float d = 100; // Diameter
float b = 10; // Border

public void setup(){
  
  
  x = width/2;
  y = height/2;
}

public void draw(){
  background(palette[0]);
  fill(palette[1]);
  stroke(palette[2]);
  strokeWeight(b);
  ellipse(x, y, d, d);

  if(mouseX > width/2) {
    d += 0.5f; }
  else { d -= 0.5f; }

  b = (mouseY > (height/2)) ? b + 0.1f : b - 0.1f;
  b = constrain(b, 0, 50);
}

public void keyPressed() {
  p1 = PApplet.parseInt(random(1, 5));
  p2 = PApplet.parseInt(random(1, 5));

  int choice = key;
  switch(choice) {
    case 49: // Ascii "1" key
      palette = rainbow;
      break;
    case 50: // Ascii "2" key
      palette = chemistry;
      break;
    case 51: // Ascii "3" key
      palette = beach;
      break;
    case 52: // Ascii "4" key
      palette = cottage;
      break;
    case 53: // Ascii "5" key
      palette = minard;
      break;
    case 54: // Ascii "6" key
      palette = kitties;
      break;
  }
}
  public void settings() {  size(600, 200);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex06_04" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

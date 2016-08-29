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

public class Ex03_09 extends PApplet {
  public void setup() {
// Ex03_09



background(0xffd9c6b0);
strokeWeight(5);

stroke(0xff314650);
beginShape();
vertex(200, 150);
vertex(150, 125);
vertex(150, 75);
vertex(200, 50);
vertex(250, 75);
vertex(250, 125);
endShape(CLOSE);

stroke(0xff45718c);
beginShape();
vertex(400, 150);
vertex(350, 125);
vertex(350, 75);
vertex(400, 50);
vertex(450, 75);
vertex(450, 125);
endShape(CLOSE);
    noLoop();
  }

  public void settings() { 
size(600, 200); 
smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex03_09" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

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

public class Ex04_06 extends PApplet {
  public void setup() {
// Ex04_06

// Manually entering test
String deerHunterOntology = "This is this. It's not something else. This is this.";
println(deerHunterOntology);



background(0xffeeeeee);
fill(0xff000000);
text(deerHunterOntology, 100, 140);
    noLoop();
  }

  public void settings() { 
size(600, 200); 
smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex04_06" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

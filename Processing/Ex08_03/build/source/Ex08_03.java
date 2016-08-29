import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Ex08_03 extends PApplet {

// Ex08_03: Using video files in sketches

 // To use video files

Movie trainMovie;

public void setup() {
  
  background(0);
  trainMovie = new Movie(this, "station.mov");
  trainMovie.loop();
}

public void movieEvent(Movie trainMovie) {
  trainMovie.read();
}

public void draw() {
  background(0);
  image(trainMovie, 0, 0);
  image(trainMovie, mouseX, mouseY);
}
  public void settings() {  size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex08_03" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Ex08_05 extends PApplet {

// Ex08_05: Using sound in sketches
// Must import a number of sound libraries to get sound in sketch

/* Another sound library to consider is the 'beads'
  library (http://www.beadsproject.net). */


// import ddf.minim.analysis.*;
// import ddf.minim.effects.*;
// import ddf.minim.signals.*;
// import ddf.minim.spi.*;
// import ddf.minim.ugens.*;

Minim soundCode;
AudioPlayer birdSong;

public void setup() {
  

  // Picture
  PImage bird;
  bird = loadImage("bird.png");
  image(bird, 0, 0, width, height);

  // Sound
  soundCode = new Minim(this);
  birdSong = soundCode.loadFile("bird.wav");
  birdSong.play();
}

/* To get sound to play, MUST have a draw function,
  even if it is an empty block! */
public void draw() {

}

public void stop() {
  birdSong.close();
  soundCode.stop();
  super.stop();
}
  public void settings() {  size(400, 250); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex08_05" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

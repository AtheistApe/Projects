// Ex08_05: Using sound in sketches
// Must import a number of sound libraries to get sound in sketch

/* Another sound library to consider is the 'beads'
  library (http://www.beadsproject.net). */

import ddf.minim.*;
// import ddf.minim.analysis.*;
// import ddf.minim.effects.*;
// import ddf.minim.signals.*;
// import ddf.minim.spi.*;
// import ddf.minim.ugens.*;

Minim soundCode;
AudioPlayer birdSong;

void setup() {
  size(400, 250);

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
void draw() {

}

void stop() {
  birdSong.close();
  soundCode.stop();
  super.stop();
}

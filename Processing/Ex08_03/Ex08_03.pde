// Ex08_03: Using video files in sketches

import processing.video.*; // To use video files

Movie trainMovie;

void setup() {
  size(640, 480);
  background(0);
  trainMovie = new Movie(this, "station.mov");
  trainMovie.loop();
}

void movieEvent(Movie trainMovie) {
  trainMovie.read();
}

void draw() {
  background(0);
  image(trainMovie, 0, 0);
  image(trainMovie, mouseX, mouseY);
}

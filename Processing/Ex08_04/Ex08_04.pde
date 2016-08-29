// Ex08_04: Export sketch as a movie.
// Based on Ex07_01

void setup() {
  size(600, 200);
  smooth();
  frameRate(8);
  background(255); // Bright white.
}

void draw() {
  noStroke();
  fill(220, 0, 0);
  ellipse(mouseX, mouseY, 10, 10);
  fill(120);
  ellipse(pmouseX, pmouseY, 10, 10);
  stroke(120);
  line(mouseX, mouseY, pmouseX, pmouseY);
  /* The next line is the ONLY new line needed
    to create a movie of the sketch. The frames
    of the movie will be in a folder 'frames'
    as four digit, sequentially numbered .png
    files */
  saveFrame("frames/####.png");

  /* Once all frames have been created, go to
    processing -> tools -> MovieMaker and follow
    the instructions */
}

void mousePressed() {
  background(255);
}

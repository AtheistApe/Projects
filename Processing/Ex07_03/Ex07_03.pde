// Ex07_03: Keyboard interactions with sketch

color[] cottage = {#C3CCC8, #442412, #475D1C, #859356, #B9961C};
color[] palette = cottage;

int lf = palette[2];
int rf = palette[2];

int s = 120;

void setup() {
  size(600, 200);
  smooth();
  rectMode(CENTER);
  stroke(palette[1]);
  strokeWeight(5);
}

void draw() {
  background(palette[0]);

  // Draw circle on left
  fill(lf);
  ellipse(width/3, height/2, s, s);

  // Draw square on right
  fill(rf);
  rect(width*2/3, height/2, s, s);

  // Detect if any key is pressed
  if(keyPressed) {
    // Click "l" key
    if(key == 'l') {
      lf = palette[4];
    } else {
      lf = palette[2];
    }

    // Click "r" key
    if(key == 'r') {
      rf = palette[4];
    } else {
      rf = palette[2];
    }
  }

  // // Detect clicking on circle
  // if(dist(width/3, height/2, mouseX, mouseY) < s/2 && mousePressed) {
  //   lf = palette[4];
  // } else {
  //   lf = palette[2];
  // }
  //
  // // Detect clicking on square
  // if((mouseX > width*2/3 - s/2) &&
  //   (mouseX < width*2/3 + s/2) &&
  //   (mouseY > height/2 - s/2) &&
  //   (mouseY < height/2 + s/2) && mousePressed) {
  //     rf = palette[4];
  //   } else {
  //     rf = palette[2];
  //   }
}

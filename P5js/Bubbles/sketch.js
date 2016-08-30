var bubbles = [];

function setup() {
  createCanvas(600,400);
}

function mouseDragged() {
  bubbles.push(new Bubble(mouseX, mouseY));
}

function mousePressed() {
  for (var i = 0; i < bubbles.length; ++i) {
    bubbles[i].clicked();
  }
}

function draw() {
  background(255);
  for (var i = 0; i < bubbles.length; i++) {
    bubbles[i].move();
    bubbles[i].display();
  }
}

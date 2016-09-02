var bubbles = [];

function setup() {
  createCanvas(600,400);
}

function mouseDragged() {
  bubble = new Bubble(mouseX, mouseY);
  bubble.pos = bubbles.length;
  bubbles.push(bubble);

  // println(bubble.pos);
}

function mouseClicked() {
  for (var i = 0; i < bubbles.length; i++) {
    d = dist(mouseX, mouseY, bubbles[i].x, bubbles[i].y);
    if (d < 15) {
      bubbles.splice(i, 1);
    }
  }
}

function draw() {
  background(255);
  for (var i = 0; i < bubbles.length; i++) {
    bubbles[i].move();
    bubbles[i].display();
  }
}

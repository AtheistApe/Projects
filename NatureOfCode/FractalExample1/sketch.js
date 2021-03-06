var xoff;

function setup() {
  createCanvas(640, 640);
  xoff = 0;
}

function draw() {
  background(31);
  stroke(255);
  noFill();

  // ellipse(width/2, height/2, 300, 300);
  drawCircle(width/2, height/2, 300);
  noLoop();
}

function drawCircle(x, y, d) {
  xoff += 0.0
  ellipse(x, y, d, d);
  if (d > 14) {
    // drawCircle(x+noise(xoff)*d/2, y, d/2);
    // drawCircle(x-noise(xoff)*d/2, y, d/2);
    drawCircle(x+d/2, y, d/2);
    drawCircle(x, y+d/2, d/2);
    drawCircle(x, y-d/2, d/2);
  }
}
var xoff;

function setup() {
  createCanvas(800, 800);
  xoff = 0;
}

function draw() {
  background(31);
  stroke(255);
  noFill();

  // ellipse(width/2, height/2, 300, 300);
  drawCircle(width/2, height/2, 800);
  noLoop();
}

function drawCircle(x, y, d) {
  var radius = d/(2*(1+sqrt(2)));
  xoff += 0.0
  ellipse(x, y, d, d);
  if (d > 8) {
    // drawCircle(x+noise(xoff)*d/2, y, d/2);
    // drawCircle(x-noise(xoff)*d/2, y, d/2);
    drawCircle(x+d/2-radius, y, 2*radius);
    drawCircle(x, y+d/2-radius, 2*radius);
    drawCircle(x, y-d/2+radius, 2*radius);
    drawCircle(x-d/2+radius, y, 2*radius)
  }
}

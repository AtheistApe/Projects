var balls = [];
var blip;

function preload() {
  blip = loadSound('blip4.wav');
}

function setup() {
  createCanvas(600, 400);
}

function draw() {
  background(220);
  for (i = 0; i < balls.length; i++) {
   balls[i].move();
   balls[i].display();
 }
}

function mousePressed() {
    ball = new Ball();
    balls.push(ball);
}

function hex_color(r, g, b) {
  var hx = "#" + hex(r,2) + hex(g,2) + hex(b,2);
  return color(hx);
}

function colorAlpha(aColor, alpha) {
  var c = color(aColor);
  return color('rgba(' +  [red(c), green(c), blue(c), alpha].join(',') + ')');
}

function Ball() {
  this.position = createVector(mouseX, mouseY);
  this.velocity = createVector(random(-4,4), random(-4,4));
  this.acceleration = createVector(0, 0.045);
  this.col = colorAlpha(hex_color(random(255), random(255), random(255)), 0.8);

  this.diam = random(15,50);
  this.rad = 0.5 * this.diam;

  this.move = function() {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);

    if (this.position.x + this.rad >= width || this.position.x - this.rad <= 0) {
      this.velocity.x *= -1;
      blip.play();
    }

    if (this.position.y + this.rad >= height) {
      this.velocity.y *= -0.95;
      blip.play();
    }
    if (this.position.y - this.rad <= 0) {
      this.velocity.y *= -1;
      blip.play();
    }
  }

  this.display = function() {
    fill(this.col);
    ellipse(this.position.x, this.position.y, this.diam, this.diam);
  }
}

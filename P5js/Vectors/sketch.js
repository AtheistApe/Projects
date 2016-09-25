var balls = [];
var heading;
var blip;

function preload() {
  blip = loadSound('blip4.wav');
}

function setup() {
  createCanvas(600, 400);
  heading = select('#color_txt');
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
  return hx;
}

function Ball() {
  this.position = createVector(mouseX, mouseY);
  this.velocity = createVector(random(-4,4), random(-4,4));
  this.accelleration = createVector(0, 0.1);

  this.col = hex_color(random(255), random(255), random(255));
  this.diam = random(15,50);
  this.rad = 0.5 * this.diam;
  this.grounded = false;

  this.move = function() {
    if (abs(this.position.y + this.rad - height) < 1 &&
     abs(this.velocity.y) < 1) {
      this.grounded = true;
      this.accelleration.y = 0;
      this.velocity.y = 0;
      this.position.y = height - this.rad;
      // this.position.y = height - this.rad;
      // this.position.x += this.velocity.x;
      // this.velocity.y = 0;
    }

    this.velocity.add(this.accelleration);
    this.position.add(this.velocity);


    // if (this.position.x + this.rad > width || this.position.x - this.rad < 0) {
    //   this.velocity.x *= -1;
    //   blip.play();
    //   // this.velocity.y = random(-3,3);
    //   heading.style('color', this.col);
    // }

      if (this.position.x + this.rad >= width || this.position.x - this.rad <= 0) {
        this.position.x = (this.position.x + this.rad >= width ? width-this.rad : this.rad);
        this.velocity.x *= -1;
        blip.play();
        heading.style('color', this.col);
      }

    if (this.position.y + this.rad >= height || this.position.y - this.rad <= 0) {
      this.position.y = (this.position.y + this.rad >= height ? height-this.rad : this.rad);
      this.velocity.y *= -1;
      if (!this.grounded) {
        blip.play();
        heading.style('color', this.col);
      }
    }

    // if (this.position.y + this.rad > height) {
    //   this.position.y = height - this.rad;
    //   this.velocity.y *= -0.8;
    //   blip.play();
    //   heading.style('color', this.col);
    // }
    //
    // else if (this.position.y - this.rad < 0) {
    //   this.position.y = this.rad;
    //   this.velocity *= -1;
    //   blip.play();
    //   heading.style('color', this.col);
    // }
  }

  this.display = function() {
    fill(this.col);
    ellipse(this.position.x, this.position.y, this.diam, this.diam);
  }
}

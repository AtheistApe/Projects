var prey;
var predator;

function setup() {
  createCanvas(600, 400);
  prey = new Prey();
  predator = new Predator();
}

function draw() {
  background(200);
  predator.move();
  prey.move()
  predator.display();
  prey.display();
}

function Prey() {
  // this.vxoff = 0;
  // this.vyoff = 0;
  this.size = 5;
  this.col = color(0,0,255);

  this.pos = createVector(width/2, height/2);

  this.move = function() {

    this.size = 5;
    this.col = color(0,0,255);

    this.acc = p5.Vector.sub(this.pos, predator.pos);
    this.dist = this.acc.mag();

    // When the predator gets too close, get big and turn
    // red with anger.
    if (this.dist < 100) {
      this.size = 30;
      this.col = color(255,0,0);
    }

      this.vel = createVector(random(-10,10), random(-10,10)).setMag(2);
      this.pos.add(this.vel);
  }

  this.display = function() {
    fill(this.col);
    ellipse(this.pos.x, this.pos.y, this.size, this.size);
  }
}

function Predator() {

  this.pos = createVector(random(width), random(height));
  this.vel = createVector(0, 0);
  this.acc = createVector(0, 0);
  this.col = color(255,0,0);


  this.move = function() {
    // this.mouse = createVector(mouseX, mouseY);
    this.col = color(255,0,0);
    this.acc = p5.Vector.sub(prey.pos, this.pos);
    this.dist = this.acc.mag();

    // When the predator closes in on the prey, the prey
    // frightens it and the predator, turned green,
    // reverses its acceleration.
    if (this.dist < 100) {
      this.acc.mult(-1);
      this.col = color(0,255,0);
    }

    // Scale down the acceleration to tame the
    // simulation.
    this.acc = this.acc.setMag(0.3);
    this.vel.add(this.acc);
    this.pos.add(this.vel);
  }

  this.display = function() {
    fill(this.col);
    ellipse(this.pos.x, this.pos.y, 20, 20);
  }
}

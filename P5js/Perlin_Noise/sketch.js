var walkers = []

function Walker(tx, ty, c) {
  this.tx = tx;
  this.ty = ty;
  this.c = c;
  this.x = 0;
  this.y = 0;

  this.display = function() {
    fill(this.c);
    ellipse(this.x, this.y, 40, 40);
  }

  this.step = function() {
    this.x = map(noise(this.tx), 0, 1, 0, width);
    this.y = map(noise(this.ty), 0, 1, 0, height);

    this.tx += 0.01;
    this.ty += 0.01;
  }
}

w1 = new Walker(0, 10000, 120);
w2 = new Walker(500, 6000, 50);
w3 = new Walker(3000, 900, 240);

walkers.push(w1);
walkers.push(w2);
walkers.push(w3);

function setup() {
  createCanvas(640,360);
  noStroke();
}

function draw() {
  background(200,0,0);
  for (var i = 0; i < walkers.length; i++) {
    walkers[i].display();
    walkers[i].step();
  }
}

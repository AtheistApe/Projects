var particles = [];
var gravity;
var collide;

function preload() {
  collide = loadSound('blip4.wav');
}

function setup() {
  createCanvas(600, 400);
  gravity = createVector(0, 0.1);

  for (i = 0; i < 5; i++) {
    var colr = color(random(255), random(255), random(255));
    p = new Particle(random(width), random(height), random(15,30), colr);
    particles.push(p);
  }
  console.log('This is it!');
}

function draw() {
  background(120);

  for (var i = 0; i < particles.length; i++) {
    g = gravity.copy();
    particles[i].applyForce(g.mult(particles[i].mass));

    particles[i].update();
    particles[i].display();
  }
}

var particle;
var attractor;

function setup() {
  createCanvas(640, 360);
  xoff = random(1,10000);
  particle = new Particle(400, 50, 1);
  attractor = new Attractor(width/2, height/2);

  particle.vel.set(2, 2);
}

function draw() {
  // background(51);

  var force = attractor.calculateAttraction(particle);
  particle.applyForce(force);

  particle.update();
  particle.display();

  attractor.display();
}

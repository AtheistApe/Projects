var particle;
var randForce;
var xoff;
var particles = [];
var gravity = [];

function setup() {
  createCanvas(640, 360);
  xoff = random(1,10000);
  particle1 = new Particle(200, 100, 1);
  particle2 = new Particle(400, 100, 3);

  particles.push(particle1);
  particles.push(particle2);

  for (i = 0; i < particles.length; i++) {
    gravity[i] = createVector(0, 0.05*particles[i].mass);
  }
}

// function mousePressed() {
//   console.log(particle1.vel.y + " " + particle2.vel.y);
// }

function draw() {
  background(51);

  var windx = map(noise(xoff), 0, 1, -0.05, 0.05);
  // var wind = createVector(windx, 0);
  var wind = createVector(0.1, 0);
  xoff += 0.01;

  for (i = 0; i < particles.length; i++) {
    particles[i].applyForce(gravity[i]);
    if (mouseIsPressed) {
      particles[i].applyForce(wind);
    }

    particles[i].update();
    particles[i].edges();
    particles[i].display();
  }
}

var particles = [];
var gravity;
var collide;

function preload() {
  collide = loadSound('collide.wav');
}

function setup() {
  createCanvas(600, 400);
  gravity = createVector(0, 0.1);

  for (i = 0; i < 2; i++) {
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

    var v = p5.Vector.sub(particles[0].position, particles[1].position);

    if (v.mag() < particles[0].radius + particles[1].radius) {
      gravity.rotate(HALF_PI);
      var d = particles[0].radius + particles[1].radius - v.mag();
      vHat = v.normalize();

      particles[0].applyForce(p5.Vector.mult(vHat, 3*particles[1].mass));
      particles[1].applyForce(p5.Vector.mult(vHat, -3*particles[0].mass));

      particles[0].position.add(vHat.mult(0.5*d));
      particles[1].position.add(-vHat);

      collide.play();

      var tempColr = particles[0].colr
      particles[0].colr = particles[1].colr;
      particles[1].colr = tempColr;
    }

    particles[i].update();

    // lineBetween(particles[0], particles[1]);

    // for (var j = 0; j < particles.length; j++) {
    //   if (i != j) {
    //     line(particles[i].x, particles[i].y, particles[j].x, particles[j].y);
        // if(particles[i].collision(particles[j])) {
        //   var v = p5.Vector.sub(particle[j].position, particle[i].position);
        //   console.log('distance between centers: ' + v.mag());
        //   console.log('sum of radii :' + (particle[j].radius + particle[i].radius));
          // particles[j].colr = color(0,255,0);
          // particles[i].colr = color(0,255,0);
    //     }
    //   }
    // }


    particles[i].display();
  }
}

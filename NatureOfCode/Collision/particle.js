function Particle(x, y, radius, colr) {
  this.radius = radius;
  this.colr = colr;

  this.mass = 2*radius;
  this.position = createVector(x, y);
  this.velocity = createVector(random(-5,5), random(-5,5));
  this.acceleration = createVector(0, 0);

  this.applyForce = function(force) {
    var f = p5.Vector.div(force, this.mass);
    this.acceleration.add(f);
  }

  this.collision = function(particle) {
    var v = p5.Vector.sub(this.position, particle.position);
    return v.mag() < abs(this.radius + particle.radius);
  }

  this.update = function() {

    for (var j = 0; j < particles.length; j++) {
      if ( i != j && this.collision(particles[j])) {
        // collide.play();
        var v = p5.Vector.sub(this.position, particles[j].position);

          gravity.rotate(HALF_PI);
          var d = this.radius + particles[j].radius - v.mag();
          vHat = v.normalize();

          this.applyForce(p5.Vector.mult(vHat, particles[1].mass));

          this.position.add(vHat.mult(0.5*d));

          // collide.play();

          var tempColr = this.colr
          this.colr = particles[j].colr;
          particles[j].colr = tempColr;
      }
    }

    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.acceleration.mult(0);

    // if (this.position.x > width || this.position.x < 0) {
    //   this.velocity.x *= -1;
    //   this.position.x = (this.position.x > width ? width : 0);
    //   collide.play();
    // }
    if (this.position.x + this.radius >= width || this.position.x - this.radius <= 0) {
      this.position.x = (this.position.x + this.radius >= width ? width-this.radius : this.radius);
      this.velocity.x *= -1;
      collide.play();
    }


    // if (this.position.y > height || this.position.y < 0) {
    //   this.velocity.y *= -1;
    //   this.position.y = (this.position.y > height ? height : 0);
    //   collide.play();
    if (this.position.y + this.radius >= height || this.position.y - this.radius <= 0) {
      this.position.y = (this.position.y + this.radius >= height ? height-this.radius : this.radius);
      this.velocity.y *= -1;
      collide.play();
    }
  }

  this.display = function() {
    noStroke();
    fill(this.colr);
    ellipse(this.position.x, this.position.y, 2*this.radius, 2*this.radius);
  }
}

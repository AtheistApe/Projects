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
    return v.mag() < abs(this.radius - particle.radius);
  }

  this.update = function() {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.acceleration.mult(0);

    if (this.position.x > width || this.position.x < 0) {
      this.velocity.x *= -1;
      this.position.x = (this.position.x > width ? width : 0);
    }

    if (this.position.y > height || this.position.y < 0) {
      this.velocity.y *= -1;
      this.position.y = (this.position.y > height ? height : 0);
    }
  }

  this.display = function() {
    noStroke();
    fill(this.colr);
    ellipse(this.position.x, this.position.y, 2*this.radius, 2*this.radius);
  }
}

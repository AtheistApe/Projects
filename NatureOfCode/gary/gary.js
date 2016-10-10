function Gary(x, y, m) {
  this.pos = createVector(x, y);
  this.vel = createVector(0, 0);
  this.acc = createVector(0, 0);
  this.mass = m
  this.G = 20

  this.update = function() {
    this.vel.add(this.acc);
    this.vel.mult(0.9);
    this.pos.add(this.vel);
    this.acc.set(0, 0);
  }

  this.display = function() {
    fill(255);
    image(img, this.pos.x, this.pos.y, this.mass * 10, this.mass * 10);
    //ellipse(this.pos.x, this.pos.y, this.mass * 10, this.mass * 10);
  }

  this.calculateAttraction = function(g) {
    var force = p5.Vector.sub(this.pos, g.pos);
    var distance = force.mag();
    //distance = constrain(1, width);
    force.normalize();
    var strength = (this.G * this.mass * g.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  

  this.applyForce = function(force) {
    var f = force.copy();
    f.div(this.mass);
    this.acc.add(f);
  }

  this.edges = function() {
    if (this.pos.y > height) {
      this.vel.y *= -1;
      this.pos.y = height;
    }
    
    if (this.pos.y < 0) {
      this.vel.y *= -1;
      this.pos.y = 0;
    }

    if (this.pos.x > width) {
      this.vel.x *= -1
      this.pos.x = width;
    }
    
    if (this.pos.x < 0) {
      this.vel.x *= -1;
      this.pos.x = 0;
    }
  }
}
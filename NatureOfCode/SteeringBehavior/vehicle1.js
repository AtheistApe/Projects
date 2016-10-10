function Vehicle(x, y) {
  this.pos = createVector(x, y);
  this.vel = createVector(0, 0);
  this.acc = createVector(0, 0);
  this.maxSpeed = 3;
  this.maxForce = 0.3;

  this.r = 6;

  this.applyForce = function(force) {
    this.acc.add(force);
  }

  this.arrive = function(target) {

    var desired = p5.Vector.sub(target, this.pos);
    var d = desired.mag();

    if (d < 100) {
      // Map the desired magnitude according to distance.
      var m = map(d, 0, 100, 0, this.maxSpeed);
      desired.setMag(m);
    }
    else {
      desired.setMag(this.maxSpeed);
    }

    var steering = p5.Vector.sub(desired, this.vel);
    steering.limit(this.maxForce);

    this.applyForce(steering);
  }

  this.update = function() {
    this.vel.add(this.acc);
    this.vel.limit(this.maxSpeed);
    this.pos.add(this.vel);
    this.acc.set(0, 0);
  }

  this.display = function() {
    var theta = this.vel.heading() + PI/2;
    fill(127);
    stroke(200);
    strokeWeight(1);
    push();
    translate(this.pos.x, this.pos.y);
    rotate(theta);
    beginShape();
    vertex(0, -this.r * 2);
    vertex(-this.r, this.r * 2);
    vertex(this.r, this.r * 2);
    endShape(CLOSE);
    pop();
  }
}

function Mouse() {
  this.pos = createVector(random(width), random(height));
  this.colr = color(random(255), random(255), random(255), 200);
  this.radius = random(15, 35);
  this.smellrad = random(200, 400);

  this.mass = this.radius * this.radius;
  this.maxvel = 1600 / this.mass;

  // this.vel = p5.Vector.random2D();
  // this.vel = this.vel.mult(0.5);
  this.vel = createVector(0, 0);
  this.acc = createVector(0, 0);
  // this.acc = this.acc.mult(0.005);

  this.applyForce = function(force) {
    var f = p5.Vector.div(force,this.mass);
    this.acceleration.add(f);
  }

  this.seekMate = function(mouse) {

  }

  this.seekFood = function() {
    var closest = {'vec':createVector(0,0), 'dist':1000};
    for (i = 0; i < flowers.length; i++) {
      vec = flowers[i].pos.sub(this.pos);
      d = vec.mag();

      if (d < this.smellrad) {
        if (d < closest['dist']) {
          closest['vec'] = vec;
          closest['dist'] = d;
        }
      }
    }
    // var m = map(closest['dist'], 0, this.smellrad, )
    force = closest['vec'].setMag(m);
    this.applyForce(force);
  }

  this.update = function() {
    this.vel.add(this.acc);
    this.vel.limit(this.maxvel);
    this.pos.add(this.vel);
    // this.acc.set(0, 0);
  }

  this.display = function() {
    noStroke;
    fill(this.colr);

    if (this.pos.y > height && this.vel.y > 0) this.pos.y = 0;
    if (this.pos.y < 0 && this.vel.y < 0) this.pos.y = height;
    if (this.pos.x > width && this.vel.x > 0) this.pos.x = 0;
    if (this.pos.x < 0 && this.vel.x < 0) this.pos.x = width;

    ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
  }
}

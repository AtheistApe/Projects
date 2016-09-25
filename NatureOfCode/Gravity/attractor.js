var Attractor = function() {
  this.pos = createVector(width/2, height/2);
  this.mass = 20;
  this.G = 1;

  this.calculateAttraction = function(p) {
    // Calculate the direction of the force.
    var force = p5.Vector.sub(this.pos, p.pos);
    // Distance between objects.
    var distance = force.mag();
    // Limit the distance to eliminate "extreme" results for very close or very far objects
    distance = constrain(distance, 5, 25);
    // Normalize the force to get a "direction" vector.
    force.normalize();
    // Calculate the gravitational force strength between the objects.
    var strength = (this.G * this.mass * p.mass) / (distance*distance);
    // Get the force vector with correct magintude and direction.
    force.mult(strength);
    return force;
  }

  this.display = function() {
    ellipseMode(CENTER);

    fill(255, 255, 0);
    ellipse(width/2, height/2, 10, 10);
  }
}

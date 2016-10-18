function Flower() {
  this.pos = createVector(random(width), random(height));

  this.numpetals = random(6,12,2);
  this.petals = [];

  this.centerdiameter = 12;

  for (var i = 0; i < this.numpetals; i++) {
    petal = {
      'petalcolor': lerpColor(color('yellow'), color('orange'), random(0,1)),
      'petallength': random(16,24)
    };

    this.petals.push(petal);
  }

  this.display = function() {
    push();
    angleMode(DEGREES);
    // translate(this.x this.y);
    translate(this.pos.x, this.pos.y);
    for (var j = 0; j < this.numpetals; j++) {
      fill(this.petals[j]['petalcolor']);
      // fill('yellow');
      rotate(360/this.numpetals);
      ellipse(this.centerdiameter/4 + this.petals[j][
        'petallength']/2, 0, this.petals[j]['petallength'], 6);
      // ellipse(this.centerdiameter/4 + 6, 0, 12, 6);
    }
    fill('red')
    ellipse(0, 0, this.centerdiameter, this.centerdiameter);
    pop();
  }
}

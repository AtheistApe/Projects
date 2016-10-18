function Flower() {
  this.pos = createVector(random(width), random(height));

  this.centdiam = 12;

  this.petals = [];
  this.numPetals = random(8,12,2);

  for (var i = 0; i < this.numPetals; i++) {
    petal = {
      'petalcolor': lerpColor(color('yellow'), color('orange'), random(0,1)),
      'petallength': random(18,24)
    };
    this.petals.push(petal);
  }

  this.display = function() {
    push();
    angleMode(DEGREES);
    translate(this.pos.x, this.pos.y);
    for (var j = 0; j < this.numPetals; j++) {
      fill(this.petals[j]['petalcolor']);
      rotate(360/this.numPetals);
      push();
      scale(0.75);
      ellipse(this.centdiam/4 + this.petals[j][
        'petallength']/2, 0, this.petals[j]['petallength'], 6);
      pop();
    }
    fill('red');
    ellipse(0, 0, this.centdiam, this.centdiam);
    pop();
    // push();
    // translate(this.x, this.y);
    // fill(255,0,0);
    // ellipse(0, 0, 5, 5);
    // pop();
  }
}

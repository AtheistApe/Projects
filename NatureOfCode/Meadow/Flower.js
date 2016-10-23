function Flower(dna_) {
// function Flower() {
  this.pos = createVector(random(width), random(height));
  this.dna = dna_;

  this.numpetals = this.dna.genes['numpetals'];
  this.petalcolor = this.dna.genes['petalcolor'];
  this.petallength = this.dna.genes['petallength'];

  // Determine the RGB values of a petals color
  petalColorValues = function(color) {
    redValue = red(color);
    blueValue = blue(color);
    greenValue = green(color);

    return {'rval':redValue, 'gval':greenValue, 'bval':blueValue};
  }

  // Measure how closely the flowers traits (petal number, petal color,
  // petal length) match the corresponding traits of the target flower.
  // Return these measures as a dictionary.
  this.fitness = function(flower) {
    numpetaldiff = abs(this.numpetals - flower.dna.genes['numpetals']);
    petallengthdiff = abs(this.petallength - flower.dna.genes['petallength']);

    thisColor = petalColorValues(this.petalcolor);
    otherColor = petalColorValues(flower.petalcolor);

    petalColorDiff = abs(thisColor['rval'] - otherColor['rval']) +
      abs(thisColor['gval'] - otherColor['gval']) +
      abs(thisColor['bval'] - otherColor['bval']);

    return {'numpetaldiff':numpetaldiff, 'petallengthdiff':petallengthdiff, 'petalcolordiff':petalColorDiff};
  }

  this.centerdiameter = 12;

  // Draw the flower
  this.display = function() {
    push();
    angleMode(DEGREES);
    // translate(this.x this.y);
    translate(this.pos.x, this.pos.y);
    for (var j = 0; j < this.numpetals; j++) {
      fill(this.petalcolor);
      // fill('yellow');
      ellipse(this.centerdiameter/4 + this.petallength/2, 0, this.petallength, 6);
      rotate(360.0/this.numpetals);
    }

    fill('black')
    ellipse(0, 0, this.centerdiameter, this.centerdiameter);
    pop();
  }
}

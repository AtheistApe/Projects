function Flower(dna_) {
// function Flower() {
  this.pos = createVector(random(width), random(height));
  this.dna = dna_;

  this.numpetals = this.dna.genes['numpetals'];
  this.petalcolor = this.dna.genes['petalcolor'];
  this.petallength = this.dna.genes['petallength'];

  // this.numpetals = 8;
  // this.petalcolor = color('yellow');
  // this.petallength = 10;

  this.centerdiameter = 12;

  this.display = function() {
    push();
    angleMode(DEGREES);
    // translate(this.x this.y);
    translate(this.pos.x, this.pos.y);
    for (var j = 0; j < this.numpetals; j++) {
      fill(this.petalcolor);
      // fill('yellow');
      rotate(360/this.numpetals);
      ellipse(this.centerdiameter/4 + this.petallength/2, 0, this.petallength, 6);
      // ellipse(this.centerdiameter/4 + 6, 0, 12, 6);
    }
    fill('black')
    ellipse(0, 0, this.centerdiameter, this.centerdiameter);
    pop();
  }
}

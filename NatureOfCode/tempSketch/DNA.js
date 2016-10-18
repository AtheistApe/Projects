function DNA() {
  this.genes = new Array(3);
  this.genes['numpetals'] = random(6,12,2);
  this.genes['petalcolor'] = lerpColor(color('yellow'), color('red'), random(0,1));
  this.genes['petallength'] = random(16, 24);
  // this.genes = {
  //   'numpetals'   : random(6,12,2),
  //   'petalcolor'  : lerpColor(color('yellow'), color('orange'), random(0,1)),
  //   'petallength' : random(16,24)
  // };
}

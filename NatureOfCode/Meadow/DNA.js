function DNA() {
    this.genes = {
    'numpetals'   : random([5,6,7,8,9,10,11,12,13,14,15,16,17]),
    'petalcolor'  : lerpColor(color('yellow'), color('red'), random(0,1)),
    'petallength' : random(8,30)
  };
}

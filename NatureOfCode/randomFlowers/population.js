function Population(m, n) {
  this.mutationrate = m;
  this.numflowers = n;

  this.population = [];

  this.create = function() {
    for (var i = 0; i < this.numflowers; i++) {
      flower = new Flower();
      this.population.push(flower);
    }
  }

  this.display = function() {
    for (var i = 0; i < this.numflowers; i++) {
      this.population[i].display();
    }
  }
}

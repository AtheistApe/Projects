function Population(m, n) {
  this.mutationrate = m;
  this.numflowers = n;

  this.population = [];
  this.matingpool = [];

  // Create an array of random flowers
  this.create = function() {
    for (var i = 0; i < this.numflowers; i++) {
      flower = new Flower(new DNA());
      // flower = new Flower();
      this.population[i] = flower;
    }
  }

  // Display all the flowers
  this.display = function() {
    for (var i = 0; i < this.numflowers; i++) {
      this.population[i].display();
    }
  }

  // Allow for the possibility of each flowers traits to mutate.
  this.mutate = function() {
    for (var i = 0; i < this.numflowers; i++) {
      if (random() < this.mutationrate) {
        this.population[i].numpetals = random([5,6,7,8,9,10,11,12,13,14,15,16,17]);
      }
      if (random() < this.mutationrate) {
        this.population[i].petallength = random(8, 30);
      }
      if (random() < this.mutationrate) {
        this.population[i].petalcolor = lerpColor(color('yellow'), color('red'), random(0,1));
      }
    }
  }

  // Create a "mating pool" of random pairs of flowers chosen from the current
  // generation. For each pair select the traits of that pair that most closely
  // matches those of the target flower and use those traits to build the next
  // generation of flowers.
  this.mate = function() {
    newpopulation = [];

    for (var i = 0; i < this.numflowers; i++) {
      this.matingpool[i] = [this.population[floor(random(this.numflowers))],
        this.population[floor(random(this.numflowers))]];
    }

    for (var j = 0; j < this.numflowers; j++) {
      newdna = new DNA();
      if (this.matingpool[j][0].fitness(target_flower)['numpetaldiff'] < this.matingpool[j][1].fitness(target_flower)['numpetaldiff']) {
          numpetals = this.matingpool[j][0].numpetals; }
      else { numpetals = this.matingpool[j][1].numpetals; }

      if (this.matingpool[j][0].fitness(target_flower)['petallengthdiff'] < this.matingpool[j][1].fitness(target_flower)['petallengthdiff']) {
          petallength = this.matingpool[j][0].petallength; }
      else { petallength = this.matingpool[j][1].petallength; }

      if (this.matingpool[j][0].fitness(target_flower)['petalcolordiff'] < this.matingpool[j][1].fitness(target_flower)['petalcolordiff']) {
          petalcolor = this.matingpool[j][0].petalcolor; }
      else { petalcolor = this.matingpool[j][1].petalcolor; }

      newdna.genes = {'numpetals':numpetals, 'petallength':petallength,
        'petalcolor':petalcolor};

      newpopulation[j] = new Flower(newdna);
    }
    this.population = newpopulation;
  }
}

var population;
var matingpool;

function setup() {
  createCanvas(640, 480);
  frameRate(1);

  // We create the target to which our flowers will evolve. We can
  // specify the target flowers number of petals, its petal color
  // and petal length.
  target_dna = new DNA();
  target_dna.genes = {'numpetals':12, 'petalcolor':color(255,30,0),
    'petallength':25};
  target_flower = new Flower(target_dna);

  // We make an initial population of random flowers specifying the flower
  // populations mutation rate and number of flowers.
  population = new Population(0.02, 30);
  population.create();
}

function draw() {
  background(255);
  population.display(); // Display the current generation of flowers
  population.mate(); // Cross random pairs of flowers to create new generation
  population.mutate(); // Allow for random mutation of traits
}

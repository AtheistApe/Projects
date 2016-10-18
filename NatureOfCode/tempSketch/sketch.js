var population;

function setup() {
  createCanvas(640, 480);
  // frameRate(2);

  population = new Population(0.1, 50);
  population.create();
}

function draw() {
  background(255);
  population.display();
}

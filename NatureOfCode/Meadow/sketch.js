var population;
var matingpool;

var numpetal_slider;
var petalcolor_slider;
var petallength_slider;

var target_dna;

var tfc; // Target flower canvas

function setup() {
  createCanvas(640, 480);

  tfc = createGraphics(100, 100);
  createImg(tfc.show());
  // createP('');
  numpetal_slider = createSlider(5,17,5);
  // numpetal_slider.position(5, height+10);
  petallength_slider = createSlider(8,30,30);
  // petallength_slider.position(5, height+20);
  petalcolor_slider = createSlider(0,100,30);
  // petalcolor_slider.position(5, height+15);
  frameRate(1);

  // We create the target to which our flowers will evolve. We can
  // specify the target flowers number of petals, its petal color
  // and petal length.
  target_dna = new DNA();
  // target_dna.genes = {'numpetals':petallength_slider.value(),
  //   'petalcolor':lerpColor(color('yellow'),color('red'),petalcolor_slider.value()),
  //   'petallength':petallength_slider.value()};
  // target_flower = new Flower(target_dna);
  // tfc.target_flower.display();

  // We make an initial population of random flowers specifying the flower
  // populations mutation rate and number of flowers.
  population = new Population(.005, 80);
  population.create();
}

function draw() {
  background(255);
  target_dna.genes = {'numpetals':numpetal_slider.value(),
  'petalcolor':lerpColor(color('yellow'),color('red'),petalcolor_slider.value()/100),
  'petallength':petallength_slider.value()};

  target_flower = new Flower(target_dna);
  target_flower.pos.x = tfc.width/2;
  target_flower.pos.y = tfc.height/2;
  tfc.background(255);
  tfc.fill(255,0,0);
  // tfc.target_flower.display();

  population.display(); // Display the current generation of flowers
  population.mate(); // Cross random pairs of flowers to create new generation
  population.mutate(); // Allow for random mutation of traits
}

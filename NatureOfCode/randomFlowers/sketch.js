var population;
// var flowers = [];
// var numflowers = 50;

function setup() {
  createCanvas(640, 480);

  population = new Population(0.1, 50);
  population.create();
  // for (i = 0; i < numflowers; i++) {
  //   flower = new Flower();
  //   flowers.push(flower);
  // }
}

function draw() {
  background(255);
  population.display();
  // for (i = 0; i < flowers.length; i++) {
  //   flowers[i].display();
  // }
}

// function mousePressed() {
//   flower = new Flower();
//   flowers.push(flower);
//   // console.log(flowers[flowers.length - 1].petals[0]['petalcolor']);
// }

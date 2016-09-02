var bubbles = [];
var planets = [];
var num_planets = 0;

// function preload() {
//   planets[0] = loadImage('images/planet0.png');
//   planets[1] = loadImage('images/planet1.png');
//   planets[2] = loadImage('images/planet2.png');
// }

function preload() {
  for (var i = 0; i <= 2; i++) {
    planets[i] = loadImage('images/planet' + i + '.png');
  }
}

function setup() {
  createCanvas(600, 400);
  createElement('h1', 'My favorite planets');
}

function mousePressed() {
  var r = floor(random(0, planets.length));
  var b = new Bubble(mouseX, mouseY, planets[r]);
  num_planets += 1;
  bubbles.push(b);
  createP("There are " + num_planets + " planets on the canvas");
}

function draw() {
  background(0);
  for (var i = bubbles.length - 1; i >= 0; i--) {
    bubbles[i].update();
    bubbles[i].display();
  }
}

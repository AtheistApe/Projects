var canvas;
var h1;
var x = 80;
var y = 80;

function setup() {
  canvas = createCanvas(200,200);
  canvas.position(300,500);
  h1 = createElement('h1', "Waiting...");
  // h1.position(300,600);
}

function mousePressed() {
  h1.html("Now I will show you my favorite number");
  createP("My favorite number is " + random(0, 10));
}

function draw() {
  background(150);
  // clear();
  fill(255, 0, 0);
  rect(x, y, 50, 50);
  h1.position(x, y);
  x += random(-2, 2);
  y += random(-2, 2);
}

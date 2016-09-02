// var b1;
// var b2;
var bubbles = [];

function setup() {
  createCanvas(600, 400);
  for (var i = 0; i < 80; i++) {
    bubbles[i] = new Bubble(random(width), random(height));
  }
  // bubbles[0] = new Bubble(250, 200);
  // bubbles[1] = new Bubble(350, 200);
}

function draw() {
  background(0);

  for (var i = 0; i < bubbles.length; i++) {
    bubbles[i].update();
    bubbles[i].display();
      for (var j = i+1; j < bubbles.length; j++) {
        if (bubbles[i].intersects(bubbles[j])) {
    // for (var j = 1; j < bubbles.length; j++) {
    //   if (i != j && bubbles[i].intersects(bubbles[j])) {
        bubbles[i].changeColor();
        bubbles[j].changeColor();
      }
    }
  }

  // bubbles[0].update();
  // bubbles[1].update();
  // bubbles[0].display();
  // bubbles[1].display();

  if (bubbles[0].intersects(bubbles[1])) {
    bubbles[0].changeColor();
    bubbles[1].changeColor();
  }
}

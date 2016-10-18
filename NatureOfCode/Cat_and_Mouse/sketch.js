var mice = [];
var flowers = [];
var numFlowers = 12;

function setup() {
  createCanvas(640, 480);
  for (i = 0; i < numFlowers; i++) {
    flower = new Flower();
    // flower.display();
    flowers.push(flower);
  }
}

function draw() {
  background(255);

  for (j = 0; j < numFlowers; j++) {
    flowers[j].display();
  }

  for (i = 0; i < mice.length; i++) {
    mice[i].update();
    mice[i].display();
  }
}

function mousePressed() {
  mouse = new Mouse();
  mouse.pos.x = mouseX;
  mouse.pos.y = mouseY;
  mice.push(mouse);
}

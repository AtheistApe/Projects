var img;
var garys = [];

function preload() {
  img = loadImage("gary.png");
}

function setup() {
  createCanvas(1024,768);
  for (var i = 0; i < 30; i++) {
    garys[i] = new Gary(random(width), random(height), random(0.5,1) * 15);
  }
  
}

function draw() {
  background(51);
  
  for (var i = 0; i < garys.length; i++) {
    attraction = createVector(0, 0);
    for (var j = 0; j < garys.length; j++) {
      if (i != j) {
        attraction.add(garys[j].calculateAttraction(garys[i]));
      }
    }
    garys[i].applyForce(attraction);
    garys[i].edges();
    garys[i].update();
    garys[i].display();
    
  }
}
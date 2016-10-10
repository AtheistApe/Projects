var r = 0.333333;
var center;

function setup() {
  createCanvas(600, 400);
  center = createVector(width/2, height/2);
}

function drawLine(v1, v2) {
  line(v1.x, v1.y, v2.x, v2.y);
}

function cantor(pos1, pos2) {
  var vec = p5.Vector.sub(pos1, pos2);
  var length = vec.mag();
  if (length > 1) {
    var pm1 = p5.Vector.add(pos1, p5.Vector.mult(vec, r));
    var pm2 = p5.Vector.add(pos2, p5.Vector.mult(vec, -1*r));

    drawLine(pos1, pm1);
    drawLine(pm2, pos2);
    
    cantor(pos1, pm1);
    // cantor(pm2, pos2);
  }
}

function draw() {
  background(255);
  mouse = createVector(mouseX, mouseY);

  cantor(center, mouse);
}

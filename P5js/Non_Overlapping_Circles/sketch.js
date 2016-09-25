var circles = [];

function setup() {
  createCanvas(640,360);
  // fill(255, 0, 150, 100);
  noStroke();

  circle = new Circle();
  circles.push(circle);
  while (circles.length <= 650) {
  // for (var i = 0; i < 100000; i++) {
    var overlap = false;
    other = new Circle();
    for (var j = 0; j < circles.length; j++) {
      var circle = circles[j];
      var d = dist(other.xpos, other.ypos, circles[j].xpos, circles[j].ypos);
      if ( d < other.r + circle.r) {
        overlap = true;
        break;
      }
    }
    if (!overlap) {
      other.display();
      circles.push(other);
    }
  }
}

function Circle() {
  this.xpos = random(width);
  this.ypos = random(height);
  this.r = random(3, 60);
  this.col = color(random(255), random(255), random(255));

  this.display = function() {
    fill(this.col)
    ellipse(this.xpos, this.ypos, 2*this.r, 2*this.r);
  }
}

function draw() {

}

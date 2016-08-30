function Bubble(x, y) {
  this.x = x;
  this.y = y;
  this.red = random(0,255);
  this.green = random(0,255);
  this.blue = random(0,255);

  this.display = function() {
    noStroke();
    fill(this.red,this.green,this.blue,95);
    ellipse(this.x, this.y, 30, 30);
  }

  this.clicked = function() {
    var d = dist(mouseX, mouseY, this.x, this.y);
    if (d < 15) {
      this.red = 255;
      this.green = 0;
      this.blue = 0
    }
  }

  this.move = function() {
    this.x += random(-1,1);
    this.y += random(-1,1);
  }
}

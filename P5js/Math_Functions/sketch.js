function setup() {
  createCanvas(500, 300);
  // translate(250, 150);
}

function draw() {
  translate(width/2, height/2);
  // scale(5);
  ellipse(0,0,50,50);

  for (var x = -200; x <= 200; x += 1) {
    point(x, 30*sin(0.05*x));
  }

}

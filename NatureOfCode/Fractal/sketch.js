var colors = ['#FF0000', '#00FF00', '#0000FF', '#0F0F0F', '#F0F0F0'];

function setup() {
  createCanvas(600, 400);
}

function draw() {
  stroke(colors[2]);
  ellipse(width/2, height/2, 200, 200);
}
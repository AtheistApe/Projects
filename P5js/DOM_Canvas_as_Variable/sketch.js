var slider;
var pg;

function setup() {
  createCanvas(200, 200);
  createP('slider');
  
  pg = createGraphics(50,50);
  // pg.fill(0,0,255);
  
  slider = createSlider(5,48,0.1);
  createImg(pg.show());
  // img.position(300, 0);
  // img.size(50,50);
  

}
function draw() {
  background(255,0,0);
  fill(0,255,0);
  ellipse(width/2, height/2, 3*slider.value(), 2*slider.value());
  
  pg.background(255,0,0);
  pg.fill(0,0,255);
  pg.ellipse(pg.width/2, pg.height/2, slider.value(), slider.value());

}
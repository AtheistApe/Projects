// Ex06_06: Creating spirals

color[] dessert = {#9F9694, #791F33, #BA3D49, #F1E6D4, #E2E1DC};
color[] palette = dessert;

float x, y;
float radiusCircle = 100;

size(400, 400);
translate(width/2, height/2);
background(palette[0]);
smooth();

// // Draw a circle using "ellipse"
// ellipseMode(RADIUS);
// stroke(palette[1]);
// noFill();
// ellipse(0, 0, radiusCircle, radiusCircle);

// // Draw a circle with points
// stroke(palette[4]);
// strokeWeight(5);
//
// for(float angle = 0; angle < 2*PI; angle += 0.1) {
//   x = cos(angle) * radiusCircle;
//   y = sin(angle) * radiusCircle;
//   point(x, y);
// }


// // Draw a spiral with points
// float radiusSpiralDots = 10;
// stroke(palette[3]);
// strokeWeight(5);
//
// for(float angle = 0; angle < 8*PI; angle += 0.1) {
//   radiusSpiralDots += 0.5;
//   x = cos(angle) * radiusSpiralDots;
//   y = sin(angle) * radiusSpiralDots;
//   point(x, y);
// }

// Draw a spiral curve

float px = -999;
float py = -999;
float radiusSpiralLine = 10;
stroke(palette[2]);
strokeWeight(1);

for(float angle = 0; angle < 8*PI; angle += 0.05) {
  radiusSpiralLine += 0.25;
  x = cos(angle) * radiusSpiralLine;
  y = sin(angle) * radiusSpiralLine;
  if( px > -999 ) {
    line(x, y, px, py);
  }
  px = x;
  py = y;
  point(x, y);
}

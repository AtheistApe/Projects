// Ex03_05

size(600, 200);
smooth();
strokeWeight(5);

// Form: arc(x_center, y_center, width, height, start, stop);
// start and stop in radians.

arc(100, 100, 75, 75, 0, PI*0.5);

noFill();

arc(233, 100, 75, 75, 0, PI);

fill(0, 191, 255);
noStroke();
arc(367, 100, 75, 75, 0, radians(270));

stroke(0);
arc(500, 100, 75, 75, 0, TWO_PI);
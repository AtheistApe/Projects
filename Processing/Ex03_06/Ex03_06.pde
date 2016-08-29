// Ex03_06

size(600, 200);
smooth();
background(#ffffcd);

strokeWeight(5);

rectMode(CORNER); // default
rect(60, 60, 80, 80);

rectMode(CENTER);
noStroke();
fill(#cc5c54);
rect(300, 100, 80, 80);

rectMode(CORNERS);
stroke(#f69162);
noFill();
rect(460, 60, 540, 140);
// Ex05_05: positioning shapes

size(600, 200);
smooth();
strokeWeight(20);

// Rectangles

// rectMode(CORNER); // default placement from top left corner.
// stroke(#ff0000); // red
// rect(250, 50, 100, 100);
//
// rectMode(CENTER); // place with center at given coordinates
// stroke(#00ff00); // green
// rect(150, 100, 100, 100);
//
// rectMode(CORNERS); // x-y coords for top left and bottom right corners, resp.
// stroke(#0000ff); // blue
// rect(400, 50, 500, 150);

// Ellipses

noFill();
ellipseMode(CENTER); // default mode
stroke(#ff0000); // red
ellipse(width/2, height/2, 100, 100); // center an ellipse on the canvas

ellipseMode(CORNER); /* position ellipse from upper left
corner of rectangular bounding box */
stroke(#0000ff); // blue
ellipse(width/2 - 125, height/2 - 50, 100, 100);

ellipseMode(CORNERS); /* define x-y coords of top left and bottom right
corners of rectangular bounding box of the ellipse */
stroke(#00ff00); // green
ellipse(325, 50, 425, 150);

ellipseMode(RADIUS); // positions ellipse by center and radius
stroke(#999999); // grey
ellipse(width/2, height/2, 25, 25);

// Ex05_04: Modifying how lines, circles and rectangles are drawn.

color[] rainbow = {#ffffcd, #cc5c54, #f69162, #85a562, #7ab5db};

size(600, 200);
background(rainbow[0]);
// smooth(); // turns anti-aliasing on. 'noSmooth' turns it off.

strokeWeight(20);
stroke(rainbow[1]);

// strokeCap(ROUND); // default value
// line(50, height*0.25, 550, height*0.25);
//
// strokeCap(SQUARE); // square ends
// line(50, height*0.5, 550, height*0.5);
//
// strokeCap(PROJECT); // line same length as 'ROUND' caped lines.
// line(50, height*0.75, 550, height*0.75);

noFill();
strokeJoin(MITER); // default value
rect(50, 50, 100, 100);

strokeJoin(BEVEL); // beveled corners
rect(200, 50, 100, 100);

strokeJoin(ROUND); // rounded corners
rect(350, 50, 100, 100);

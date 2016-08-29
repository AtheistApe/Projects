// Ex03_10

size(600, 200);
smooth();
background(#c3ccc8);
strokeWeight(5);

stroke(#442412);
curve(100, 300, 100, 100, 200, 100, 200, 300);

noFill();
stroke(#b9961c);
curveTightness(3);
curve(250, 300, 250, 100, 350, 100, 350, 300);

stroke(#475d1c);
curveTightness(-3);
curve(400, 300, 400, 100, 500, 100, 500, 300);
// Ex08_02: Using images in sketches

size(600, 200);

PImage spaceInvader;
spaceInvader = loadImage("SpaceInvaderRed.jpg");
// image(spaceInvader, 0, 0, 200, 150); /* Parameters after
// image are location (x, y) and size (width, height).
// Leaving off the size parameters imports image with
// default size (no rescaling) */
image(spaceInvader, 0, 0);
filter(BLUR, 3); // Filter must come after thing it is applied to.

// Importing an image from the web
PImage webInvader;
String url = "http://farm3.staticflickr.com/2397/2148858093_0b469eeb97.jpg";
webInvader = loadImage(url);
image(webInvader, 300, 0, 300, 200); // Had to rescale to make it fit
filter(GRAY); // Applies to ALL previous images.

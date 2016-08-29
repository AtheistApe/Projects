// Ex08_01: Including text in a sketch

// // The basic version
// size(600, 200);
// background(0);
//
// String wordText = "A word is worth 1/1000th of a picture.";
// text(wordText, 50, height/2); // Position is baseline of text

// The elaborate version
size(600, 200);
background(#302F2F);

PFont sampleFont;
String wordText = "A word is worth 1/1000th of a picture.\n"
  + "something like that\n"
  + "and like this as well!";
sampleFont = loadFont("GillSansMT-20.vlw");
textFont(sampleFont);
fill(#FFE224);
textAlign(LEFT, CENTER);
textLeading(25);
text(wordText, 50, height/2); // Position is baseline of text

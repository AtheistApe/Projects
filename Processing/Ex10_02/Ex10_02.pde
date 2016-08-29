// Ex10_02: Integrating text data in sketches

color[] crowds = {#678C8B, #8FA89B, #A2BAB0, #D0EDDE, #B3B597};
color[] palette = crowds;
String[] presidents;

int i = 0;
int loop = 60*5;
int president = 1;

void setup() {
  size(750, 400);
  presidents = loadStrings("presidents.txt");
  PFont font;
  font = loadFont("Arial-BoldMT-48.vlw");
  textFont(font);
  println(presidents.length);
  println(presidents[45]);
  // frameRate(5);
}
// println(presidents);

void draw() {
  background(palette[0]);
  fill(palette[2]);
  i++;
  if (i == 1){
    president++;
  }
  else if (i == 20){
    i = 0;
  }
  if (president >= presidents.length) {
    president = 1;
  }
  text(presidents[president], mouseX, mouseY);
}

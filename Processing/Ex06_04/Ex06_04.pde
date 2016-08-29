// Ex06_04: Conditional statements
color[] rainbow = {#FFFFCD, #CC5C54, #F69162, #85A562, #7AB5DB};
color[] chemistry = {#0C2550, #A3D0C1, #FDF6DD, #FEE406, #F4651C};
color[] kitties = {#302F2F, #74AD92, #F07F47, #FFAA42, #FFE224};
color[] beach = {#D9C6B0, #314650, #2D4761, #45718C, #B6E1F2};
color[] cottage = {#C3CCC8, #442412, #475D1C, #859356, #B9961C};
color[] minard = {#666666, #607F9C, #E9CCAE, #FFFFF3, #D01312};
color[] palette = minard;

int choice;
int p1 = 1;
int p2 = 2;

float x;
float y;
float d = 100; // Diameter
float b = 10; // Border

void setup(){
  size(600, 200);
  smooth();
  x = width/2;
  y = height/2;
}

void draw(){
  background(palette[0]);
  fill(palette[1]);
  stroke(palette[2]);
  strokeWeight(b);
  ellipse(x, y, d, d);

  if(mouseX > width/2) {
    d += 0.5; }
  else { d -= 0.5; }

  b = (mouseY > (height/2)) ? b + 0.1 : b - 0.1;
  b = constrain(b, 0, 50);
}

void keyPressed() {
  p1 = int(random(1, 5));
  p2 = int(random(1, 5));

  int choice = key;
  switch(choice) {
    case 49: // Ascii "1" key
      palette = rainbow;
      break;
    case 50: // Ascii "2" key
      palette = chemistry;
      break;
    case 51: // Ascii "3" key
      palette = beach;
      break;
    case 52: // Ascii "4" key
      palette = cottage;
      break;
    case 53: // Ascii "5" key
      palette = minard;
      break;
    case 54: // Ascii "6" key
      palette = kitties;
      break;
  }
}

//the following variables dictate the relative size of different components

int rs = 100; //resistor size
int rs2 = -100; //for resistor drawn in reverse direction
int cs = 25; //capacitor size
int ds = 40; //diode size
int bs = -40; //battery size
int ss = -60; //switch size
int resheatnum = 3; //stroke of resistor when turned on

/* --------------------------------------------------------
FUNCTIONS DRAWING ALL OF THE DIFFERENT WIRES AND COMPONENTS
-------------------------------------------------------- */

void wireParallel (int c1x, int c1y, int c1s, int c2x, int c2y, int h, boolean tops) { //used to draw wire in parallel
  if (tops == true) { //tops = true if the wires are on the top half of the circuit
    line(c1x, c1y+c1s, c1x, c2y-h); //component 1&2 x&y, then size value for component 1
    line(c1x, c2y-h, c2x, c2y-h);
    line(c2x, c2y-h, c2x, c2y);
  } else if (tops == false) { //tops = false if wires are drawn on bottom half of the circuit
    line(c1x, c1y+c1s, c1x, c2y+h);
    line(c1x, c2y+h, c2x, c2y+h); //int h is used to define the height of wires
    line(c2x, c2y+h, c2x, c2y);  //use 0 if connecting to another component
  }
}

void resistorH (int r1, int r2, int rnum, float rcol) { //resistor angled in the X direction
  int res = rs/10;
  if (rnum > 0){  //rnum = Whatever resistor you want to test
    float rescolor = map (rcol, 0, .25, 0, 255);
    color resheatcol = color(int(rescolor), 0, 0);
    stroke(resheatcol);
    strokeWeight(resheatnum);
  }
  line(r1, r2, r1+res, r2-res*2);
  line(r1+res, r2-res*2, r1+res*3, r2+res*2);
  line(r1+res*3, r2+res*2, r1+res*5, r2-res*2);
  line(r1+res*5, r2-res*2, r1+res*7, r2+res*2);
  line(r1+res*7, r2+res*2, r1+res*9, r2-res*2);
  line(r1+res*9, r2-res*2, r1+res*10, r2);
  stroke(0);
  strokeWeight(1);
}

void resistorHB (int r1, int r2, int rnum, float rcol) { //resistor, drawn mirrored, angled in the X direction
  int res = rs2/10;
  if (rnum > 0){  //rnum = Whatever resistor you want to test
    float rescolor = map (rcol, 0, .25, 0, 255);
    color resheatcol = color(int(rescolor), 0, 0);
    stroke(resheatcol);
    strokeWeight(resheatnum);
  }
  line(r1, r2, r1+res, r2+res*2);
  line(r1+res, r2+res*2, r1+res*3, r2-res*2);
  line(r1+res*3, r2-res*2, r1+res*5, r2+res*2);
  line(r1+res*5, r2+res*2, r1+res*7, r2-res*2);
  line(r1+res*7, r2-res*2, r1+res*9, r2+res*2);
  line(r1+res*9, r2+res*2, r1+res*10, r2);
  stroke(0);
  strokeWeight(1);
}

void resistorV (int r1, int r2, int rnum, float rcol) { //resistor angled in the Y direction, turned on
  int res = rs/10;
  if (rnum > 0){  //rnum = Whatever resistor you want to test
    float rescolor = map (rcol, 0, .25, 0, 255);
    color resheatcol = color(int(rescolor), 0, 0);
    stroke(resheatcol);
    strokeWeight(resheatnum);
  }
  line(r1, r2, r1+res*2, r2+res);
  line(r1+res*2, r2+res, r1-res*2, r2+res*3);
  line(r1-res*2, r2+res*3, r1+res*2, r2+res*5);
  line(r1+res*2, r2+res*5, r1-res*2, r2+res*7);
  line(r1-res*2, r2+res*7, r1+res*2, r2+res*9);
  line(r1+res*2, r2+res*9, r1, r2+res*10);
  stroke(0);
  strokeWeight(1);
}

void capacitorH (int c1, int c2) {
  line(c1, c2-cs, c1, c2+cs);
  line(c1+cs, c2-cs, c1+cs, c2+cs);
}

void capacitorV (int c1, int c2) {
  line(c1-cs, c2, c1+cs, c2);
  line(c1-cs, c2+cs, c1+cs, c2+cs);
}

void ledV (int l1, int l2) {
  int dsi = ds/2;
  triangle(l1-dsi, l2, l1+dsi, l2, l1, l2+dsi*2);
  line(l1-dsi, l2+dsi*2, l1+dsi, l2+dsi*2);
  line(l1+(7*dsi)/12, l2+(5*dsi)/4, l1+dsi, l2+(3*dsi)/2);
  line(l1+dsi, l2+(3*dsi)/2, l1+dsi-3, l2+(3*dsi)/2-(dsi/4)-5);
  line(l1+dsi, l2+(3*dsi)/2, l1+dsi-(dsi/4)-3, l2+(3*dsi)/2+3);
}

void batteryV (int b1, int b2) {  //drawn bottom to top (mirrored)
  int bsi = bs/3;
  line(b1-bsi*2, b2+bsi*3, b1+bsi*2, b2+bsi*3);
  line(b1-bsi, b2+bsi*2, b1+bsi, b2+bsi*2);
  line(b1-bsi*2, b2+bsi, b1+bsi*2, b2+bsi);
  line(b1-bsi, b2, b1+bsi, b2);
}

void switchH (int s1, int s2, boolean swnum) { //switch, drawn right to left (mirrored)
  if (S1 == false) { //swnum = switch number
    line(s1, s2-ss/2, s1+ss, s2);
  } else if (swnum == true) {
    line(s1, s2, s1+ss, s2);
  }
  ellipse(s1, s2, 5, 5);
  ellipse(s1+ss, s2, 5, 5);
}


/* -------------------------
SETS UP RIGHT-HAND SIDE MENU
-------------------------- */

ControlP5 component;
int V1, V2, R1, R2, R3; //sets ints to component values
boolean S1, S2; //sets true/false to switches
int csliderx = 515; //left hand position of controls menu
int cheight = 30; //sets weight between each component in stack
int cheight2 =20;
int csheight2 =55;
int csheight = 50; //sets height between component sections
int V1slidery = 60; //starts list of components
int V2slidery = V1slidery+cheight;
int R1slidery = V2slidery+csheight;
int R2slidery = R1slidery+cheight;
int R3slidery = R2slidery+cheight;
int S1infoy = R3slidery+csheight;
int S2infoy = S1infoy+cheight;
int detMenuy = S1infoy+(70);
int Pinfoy = detMenuy+cheight2;
int Cinfoy = Pinfoy+csheight2;
int Vinfoy = Cinfoy+csheight2;
int sliderw = 200; //width of component sliders & toggles
int sliderh = 20; //height of component sliders
int togglew = 50; //width of component toggle buttons

//Right hand arrows to assist with navigation
void arrow(int menuheight, int xlow, int xhigh, int ylow, int yhigh){ //lows and highs should encompass the component image
    if (mouseX > xlow && mouseX < xhigh && mouseY > ylow && mouseY < yhigh /*|| mouseX > 525 && mouseX < 725 && mouseY > 50 && mouseY < 80*/) {
    arrowhighlighton(menuheight);
  } else {
    arrowhighlightoff(menuheight);
  }
}

void arrowhighlightoff(int menuheight){
  noStroke();
  fill(2,52,77);
  triangle(csliderx-15, menuheight+2, csliderx-15, menuheight+(sliderh-2), csliderx-5, menuheight+sliderh/2);
  stroke(0);
  fill(0,0,0);
  noFill();
}

void arrowhighlighton(int menuheight) {
  noStroke();
  fill(0,200,255);
  triangle(csliderx-15, menuheight+2, csliderx-15, menuheight+(sliderh-2), csliderx-5, menuheight+sliderh/2);
  stroke(0);
  fill(0,0,0);
  noFill();
}

//Voltage Section
void volslider() {
  component = new ControlP5(this);
  //set font color and size
  component.setControlFont(new ControlFont(createFont("Arial", 17), 17));
  component.addSlider("V1")
    .setPosition(csliderx,V1slidery) //location of slider on screen
    .setSize(sliderw,sliderh) //width x height
    .setColorValue(0xffffffff) //white value text
    .setColorLabel(0x00000000) //black label text
    .setRange(0,20) //range of slider values
    .captionLabel().getStyle().marginLeft = 8 // Left margin before R1
    ;
//  component.addSlider("V2")
//    .setPosition(csliderx,V2slidery) //location of slider on screen
//    .setSize(sliderw,sliderh) //width x height
//    .setColorValue(0xffffffff) //white value text
//    .setColorLabel(0x00000000) //black label text
//    .setRange(0,20) //range of slider values
//    .captionLabel().getStyle().marginLeft = 8 // Left margin before R1
//    ;
}

//Resistor Section
void resslider() {
  component = new ControlP5(this);
  //set font color and size
  component.setControlFont(new ControlFont(createFont("Arial", 17), 17));
  component.addSlider("R1")
    .setPosition(csliderx,R1slidery) //location of slider on screen
    .setSize(sliderw,sliderh) //width x height
    .setColorValue(0xffffffff) //white value text
    .setColorLabel(0x00000000) //black label text
    .setColorBackground(0xff969696)
    .setRange(0,1000) //range of slider values
    .captionLabel().getStyle().marginLeft = 8 // Left margin before R1
    ;
  component.addSlider("R2")
    .setPosition(csliderx,R2slidery) //location of slider on screen
    .setSize(sliderw,sliderh) //width x height
    .setColorValue(0xffffffff) //white value text
    .setColorLabel(0x00000000) //black label text
    .setColorBackground(0xff282828)
    .setRange(0,1000) //range of slider values
    .captionLabel().getStyle().marginLeft = 8 // Left margin before R1
    ;
  component.addSlider("R3")
    .setPosition(csliderx,R3slidery) //location of slider on screen
    .setSize(sliderw,sliderh) //width x height
    .setColorValue(0xffffffff) //white value text
    .setColorLabel(0x00000000) //black label text
    .setColorBackground(0xff5a5a5a)
    .setRange(0,1000) //range of slider values
    .captionLabel().getStyle().marginLeft = 8 // Left margin before R1
    ;
}

//Switch Section
void swinfo() {
  component.setControlFont(new ControlFont(createFont("Arial", 17), 17));
  component.addToggle("S1")
     .setPosition(csliderx,S1infoy)
     .setSize(togglew,sliderh)
     .setColorLabel(0x00000000) //black label text
     .setValue(false)
     .setMode(ControlP5.SWITCH)
     ;
//  component.addToggle("S2")
//     .setPosition(csliderx+sliderw-togglew-togglew/2,S1infoy)
//     .setSize(togglew,sliderh)
//     .setColorLabel(0x00000000) //black label text
//     .setValue(false)
//     .setMode(ControlP5.SWITCH)
//     ;
}

//Right menu background and text
void menuControl() {
  noStroke();
  fill(200);
  rect(500,0,width,height);
  stroke(0);
  strokeWeight(1);
  fill(0);
  textSize(18);
  textAlign(LEFT, BASELINE);
  text("CONTROLS", csliderx, 30);
  textSize(15);
  text("Battery (Measured in Volts)", csliderx, V1slidery-5);
  text("Resistor (Measured in Ohms)", csliderx, R1slidery-5);
  text("Switch", csliderx, S1infoy-5);
  textAlign(LEFT, CENTER);
  if (S1 == true){
    text("Closed", csliderx+togglew+5, S1infoy+sliderh/2);
  } else {
    text("Open", csliderx+togglew+5, S1infoy+sliderh/2);
  }
//  if (S2 == true){
//    text("Closed", csliderx+sliderw-togglew/2+5, S1infoy+sliderh/2);
//  } else {
//    text("Open", csliderx+sliderw-togglew/2+5, S1infoy+sliderh/2);
//  }
  textAlign(LEFT, BASELINE);
  noFill();
}


/* -----------------------
RIGHT MENU CIRCUIT DETAILS
----------------------- */
float W01, W02, W03;
float C11, C12, C13;
float V11, V12, V13;

void menuDetails() {
  line(csliderx, detMenuy-22, width-25, detMenuy-22);
  textSize(18);
  text("DETAILS", csliderx, detMenuy);
  textSize(15);
  text("Power", csliderx, Pinfoy);
  text("Current", csliderx, Cinfoy);
  text("Voltage", csliderx, Vinfoy);
  fill(255);
}

void curSerDet() {
  if (CS <= .15) {
    C11 = map(CS, 0, 1, 0, 258);
  }
  else if (CS > .15) {
    C11 = 258;
  }
  noStroke();
  fill(40,40,40);
  rect(csliderx, Cinfoy+5, C11, 15);
  fill(0);
  stroke(0);
  text(CS + " Amps", csliderx+15, Cinfoy+35);
  fill(255);

}

void powSerDet() {
  if (W1 <= .5) {
    W01 = map(W1, 0, 1, 0, 86);
  }
  else if (W1 > .5) {
    W01 = 86;
  }
  if (W2 <= .5) {
    W02 = map(W2, 0, 1, 0, 86);
  }
  else if (W2 > .5) {
    W02 = 86;
  }
  if (W3 <= .5) {
    W03 = map(W3, 0, 1, 0, 86);
  }
  else if (W3 > .5) {
    W03 = 86;
  }
  noStroke();
  fill(150,150,150);
  rect(csliderx, Pinfoy+5, W01, 15);
  fill(40,40,40);
  rect(csliderx+W01, Pinfoy+5, W02, 15);
  fill(90,90,90);
  rect(csliderx+W01+W02, Pinfoy+5, W03, 15);
  fill(0);
  stroke(0);
  text(W0 + " Watts", csliderx+15, Pinfoy+35);
  fill(255);

}

void volSerDet() {
  V11 = map(R1drop,0,20,0,258);
  V12 = map(R2drop,0,20,0,258);
  V13 = map(R3drop,0,20,0,258);
  noStroke();
  fill(150,150,150);
  rect(csliderx, Vinfoy+5, V11, 15);
  fill(40,40,40);
  rect(csliderx+V11, Vinfoy+5, V12, 15);
  fill(90,90,90);
  rect(csliderx+V11+V12, Vinfoy+5, V13, 15);
  fill(0);
  stroke(0);
  text(V1 + " Volts", csliderx+15, Vinfoy+35);
  fill(255);

}
void sRightDet() {
  powSerDet();
  curSerDet();
  volSerDet();
}

void powParDet() {
  if (W1 <= 1) {
    W01 = map(W1, 0, 1, 0, 86);
  }
  else if (W1 > 1) {
    W01 = 86;
  }
  if (W2 <= 1) {
    W02 = map(W2, 0, 1, 0, 86);
  }
  else if (W2 > 1) {
    W02 = 86;
  }
  if (W3 <= 1) {
    W03 = map(W3, 0, 1, 0, 86);
  }
  else if (W3 > 1) {
    W03 = 86;
  }
  noStroke();
  fill(150,150,150);
  rect(csliderx, Pinfoy+5, W01, 15);
  fill(40,40,40);
  rect(csliderx+W01, Pinfoy+5, W02, 15);
  fill(90,90,90);
  rect(csliderx+W01+W02, Pinfoy+5, W03, 15);
  fill(0);
  stroke(0);
  text(W0 + " Watts", csliderx+15, Pinfoy+35);
  fill(255);
}

void curParDet() {
  if (C1 <= .15) {
    C11 = map(C1, 0, .15, 0, 86);
  }
  else if (C1 > .15) {
    C11 = 86;
  }
  if (C2 <= .15) {
    C12 = map(C2, 0, .15, 0, 86);
  }
  else if (C2 > .15) {
    C12 = 86;
  }
  if (C3 <= .15) {
    C13 = map(C3, 0, .15, 0, 86);
  }
  else if (C3 > .15) {
    C13 = 86;
  }
  noStroke();
  fill(150,150,150);
  rect(csliderx, Cinfoy+5, C11, 15);
  fill(40,40,40);
  rect(csliderx+C11, Cinfoy+5, C12, 15);
  fill(90,90,90);
  rect(csliderx+C11+C12, Cinfoy+5, C13, 15);
  fill(0);
  stroke(0);
  text(CP + " Amps", csliderx+15, Cinfoy+35);
  fill(255);
}

void volParDet() {
  V11 = map(V1, 0, 20, 0, 258);
  noStroke();
  fill(40,40,40);
  rect(csliderx, Vinfoy+5, V11, 15);
  fill(0);
  stroke(0);
  text(V1 + " Volts", csliderx+15, Vinfoy+35);
  fill(255);
}

void pRightDet() {
  powParDet();
  curParDet();
  volParDet();
}

/* ----------------
SETS UP BOTTOM MENU
---------------- */

//Variables specific to the bottom menu
int mbleftx = 35; //sets the left hand position of bottom menu
int mbrightx = 135; //subtract from width for right hand position
int mbcolumnx = 150; //sets the spacing between each column in the bottom menu
int mbuppery = 525; //sets the upper bound of the bottom menu
int mbrowh = 10; //sets the row height for the bottom menu
boolean S3, S4; //sets the lower menu switches
PImage sPic01;
PImage pPic01;
PImage tPic;
int tutcounter = 0;

//Bottom menu background and text
void menusub() {
  noStroke();
  fill(150);
  rect(0,500,width,height);
  stroke(1);
  fill(0);
  textAlign(CENTER, BASELINE);
  textSize(18);
  text("CIRCUIT SELECTIONS", width/2, mbuppery);
  textAlign(LEFT, BASELINE);
  textSize(15);
  text("Series Circuits", mbleftx, mbuppery+mbrowh);
  textAlign(RIGHT, BASELINE);
  text("Parallel Circuits", width - mbleftx, mbuppery+mbrowh);
  line(width/2,mbuppery+mbrowh,width/2,height);
  textAlign(LEFT, CENTER);
  textAlign(LEFT, BASELINE);
  noFill();
  sSelect();
  pSelect();
}

void menuCall() {
  sPic01 = loadImage("series01.png");
  pPic01 = loadImage("parallel01.png");
  tPic = loadImage("tutorial.png");
  series01switch = false;
  parallel01switch = false;
  tutorialSwitch = false;
  tutorialSkip = false;
}

void pSelect() {
  stroke(2,52,77);
  image (pPic01, width-mbrightx, mbuppery+(mbrowh*4));
  rect (width-mbrightx, mbuppery+(mbrowh*4), 100, 100);
  if(mouseX > width-mbrightx && mouseX < width-mbrightx + 100 && mouseY > mbuppery+(mbrowh*4) && mouseY < mbuppery+(mbrowh*4) +100) {
    stroke(0,200,255);
    rect (width-mbrightx, mbuppery+(mbrowh*4), 100, 100);
    if(mousePressed == true) {
      series01switch = false;
      tutorialSwitch = false;
      parallel01switch = true;
      parallelCircuit01Call();
    }
  }
  stroke(0);

}

void sSelect() {
  stroke(2,52,77);
  image (sPic01, mbleftx, mbuppery+(mbrowh*4));
  rect (mbleftx, mbuppery+(mbrowh*4), 100, 100);
  if(mouseX > mbleftx && mouseX < mbleftx + 100 && mouseY > mbuppery+(mbrowh*4) && mouseY < mbuppery+(mbrowh*4) +100) {
    stroke(0,200,255);
    rect (mbleftx, mbuppery+(mbrowh*4), 100, 100);
    if(mousePressed == true) {
      series01switch = true;
      tutorialSwitch = false;
      parallel01switch = false;
      seriesCircuit01Call();
    }
  }
  stroke(0);
}

void menus() {
  menuControl();
  menuDetails();
  if (tutorialSkip == false) {
    menusubtut();
  } 
  if (tutorialSkip == true) {
    menusub();
  }
}

void menusubtut() {
  noStroke();
  fill(150);
  rect(0,500,width,height);
  stroke(1);
  fill(0);
  textAlign(CENTER, BASELINE);
  textSize(18);
  text("CIRCUIT SELECTIONS", width/2, mbuppery);
  textAlign(LEFT, BASELINE);
  textSize(15);
  text("Series Circuits", mbleftx, mbuppery+mbrowh);
  textAlign(RIGHT, BASELINE);
  text("Parallel Circuits", width - mbleftx, mbuppery+mbrowh);
  line(width/2,mbuppery+mbrowh,width/2,height);
  textAlign(LEFT, CENTER);
  textAlign(LEFT, BASELINE);
  noFill();
  tutwalkthrough();
  tSelect();
}

void tSelect() {
  stroke(2,52,77);
  image (tPic, mbleftx, mbuppery+(mbrowh*4));
  rect (mbleftx, mbuppery+(mbrowh*4), 100, 100);
  if(mouseX > mbleftx && mouseX < mbleftx + 100 && mouseY > mbuppery+(mbrowh*4) && mouseY < mbuppery+(mbrowh*4) +100) {
    stroke(0,200,255);
    rect (mbleftx, mbuppery+(mbrowh*4), 100, 100);
    if(mousePressed == true) {
      tutorialSwitch = true;
      series01switch = false;
      parallel01switch = false;
      tutorialCircuitCall();
    }
  }
  stroke(0);
}

void skipTuts () {
  text("Skip Tutorial", 400, 485);
  stroke(2,52,77);
  rect(390, 470, 100, 20);
  if (mouseX > 390 && mouseX < 490 && mouseY > 470 && mouseY < 490) {
    stroke(0,200,255);
    rect(390, 470, 100, 20);
    if(mousePressed == true) {
      tutorialSkip = true;
      tutorialSwitch = false;
    }
  }
  stroke(0);
}

void tutwalkthrough () {
  skipTuts();
  if (tutcounter == 0) {
    text("Please select the circuit from the menu below", 95, 250);
    if (tutorialSwitch == true) {
      tutcounter = tutcounter + 1;
    }
  }
  else if (tutcounter == 1) {
    text("Circuits can be controlled from the right menu.", 95, 230);
    //text("Error feedback will be provided in red below.", 100, 250);
    text("Please close the Switch, connecting the circuit", 95, 250);
    text("and apply Voltage and Resistance.", 95, 270);
    if (V1 > 1 && R1 > 1 && S1 == true || V1 > 1 && R2 > 1 && S1 == true) {
      tutcounter = tutcounter + 1;
    }
  }
  else if (tutcounter == 2) {
    text("Details about the circuit can also be found", 95, 230);
    text("in the right hand menu.", 95, 250);
    text("Please click \"skip tutorial\" button when finished.", 95, 270);
  }
}

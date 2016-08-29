import controlP5.*;
PFont font;
int es = 3; //sets size for electrons
boolean series01switch;
boolean parallel01switch;
boolean tutorialSwitch;
boolean tutorialSkip;
int edist = 6; //distance between ellipses/electrons


void setup() {
  size(800, 700);
  font = loadFont("ArialMT-24.vlw");
  textFont(font);
  component = new ControlP5(this);
    resslider();
    volslider();
    swinfo();
  frameRate(30);
  menuCall();
}

void draw() {
  background(255);
  //println("W0 = " + W0 + ", W1 =" + W1 + ", W2 =" + W2 + ", W3 ="  + W3 + ", CP0 =" + CP0);
  //println("CS: " + CS + ", CP0: " + CP0 + ", C1: " + C1 + ", C2: " + C2 + ", C3: " + C3);
  //println("V01: " + V01 + ", V02: " + V02 + ", V03: " + V03 + ", V04: " + V04 + ", R1drop: " + R1drop + ", R2drop: " + R2drop + ", R3drop: " + R3drop);
  menus();
  if (series01switch == true && parallel01switch == false) {
    seriesCircuit01Execute();
  }
  else if (series01switch == false && parallel01switch == true) {
    parallelCircuit01Execute();
  }
  if (tutorialSwitch == true) {
    tutorialCircuitExecute();
  }
}

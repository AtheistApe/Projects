/* -------------------------------------------------
 FOLLOWING FUNCTIONS CALL DIFFERENT PARALLEL CIRCUITS
 ------------------------------------------------- */

String parallelC = "65, 290, 190, 215, 315, 215, 440, 215, 150, 400";
int [] p1 = int(trim(parallelC.split(",")));
int para = 100;

ParallelCircuity[] pay1 = new ParallelCircuity[25];  //next 15 lines call each wire
ParallelCircuity[] pay2 = new ParallelCircuity[(p1[9]-p1[7]-rs)/edist];
ParallelCircuity[] pay3 = new ParallelCircuity[(p1[9]-p1[5]-rs)/edist];
ParallelCircuity[] pay4 = new ParallelCircuity[(p1[9]-p1[3]-rs)/edist];
ParallelCircuity[] pay5 = new ParallelCircuity[(p1[7]-para)/edist];
ParallelCircuity[] pay6 = new ParallelCircuity[(p1[5]-para)/edist];
ParallelCircuity[] pay7 = new ParallelCircuity[(p1[3]-para)/edist];
ParallelCircuitx[] pax2 = new ParallelCircuitx[(p1[6]-p1[4])/edist];
ParallelCircuitx[] pax3 = new ParallelCircuitx[(p1[4]-p1[2])/edist];
ParallelCircuitx[] pax4 = new ParallelCircuitx[(p1[2]-p1[0])/edist];
ParallelCircuitx[] pax5 = new ParallelCircuitx[(p1[6]-p1[4])/edist];
ParallelCircuitx[] pax6 = new ParallelCircuitx[(p1[4]-p1[2])/edist];
ParallelCircuitx[] pax7 = new ParallelCircuitx[(p1[2]-p1[0])/edist];
ParallelBatteryy[] pab1 = new ParallelBatteryy[(p1[1]-para+bs)/edist];
ParallelBatteryy[] pab2 = new ParallelBatteryy[(p1[9]-p1[1])/edist];

void parallelCircuit01Call () {
  for (int i = 0; i < pay1.length; i++) {
    pay1[i] = new ParallelCircuity(p1[8], p1[9], ss, p1[0], p1[1], (i*edist), true, false);
  }
  for (int i = 0; i < pay2.length; i++) {
    pay2[i] = new ParallelCircuity(p1[6], p1[7], rs, p1[8], p1[9], (i*edist), false, false);
  }
  for (int i = 0; i < pay3.length; i++) {
    pay3[i] = new ParallelCircuity(p1[4], p1[5], rs, p1[8], p1[9], (i*edist), false, false);
  }
  for (int i = 0; i < pay4.length; i++) {
    pay4[i] = new ParallelCircuity(p1[2], p1[3], rs, p1[8], p1[9], (i*edist), false, false);
  }
  for (int i = 0; i < pay5.length; i++) {
    pay5[i] = new ParallelCircuity(p1[0], p1[1], bs, p1[6], p1[7], (i*edist), false, true);
  }
  for (int i = 0; i < pay6.length; i++) {
    pay6[i] = new ParallelCircuity(p1[0], p1[1], bs, p1[4], p1[5], (i*edist), false, true);
  }
  for (int i = 0; i < pay7.length; i++) {
    pay7[i] = new ParallelCircuity(p1[0], p1[1], bs, p1[2], p1[3], (i*edist), false, true);
  }
  for (int i = 0; i < pax2.length; i++) {
    pax2[i] = new ParallelCircuitx(p1[6], p1[7], rs, p1[8], p1[9], (i*edist), false, false);
  }
  for (int i = 0; i < pax3.length; i++) {
    pax3[i] = new ParallelCircuitx(p1[4], p1[5], rs, p1[8], p1[9], (i*edist), false, false);
  }
  for (int i = 0; i < pax4.length; i++) {
    pax4[i] = new ParallelCircuitx(p1[2], p1[3], rs, p1[8], p1[9], (i*edist), false, false);
  }
  for (int i = 0; i < pax5.length; i++) {
    pax5[i] = new ParallelCircuitx(p1[0], p1[1], bs, p1[6], p1[7], (i*edist), false, true);
  }
  for (int i = 0; i < pax6.length; i++) {
    pax6[i] = new ParallelCircuitx(p1[0], p1[1], bs, p1[4], p1[5], (i*edist), false, true);
  }
  for (int i = 0; i < pax7.length; i++) {
    pax7[i] = new ParallelCircuitx(p1[0], p1[1], bs, p1[2], p1[3], (i*edist), false, true);
  }
  for (int i = 0; i < pab1.length; i++) {
    pab1[i] = new ParallelBatteryy(p1[0], p1[1], bs, p1[2], p1[3], (i*edist), false, true);
  }
  for (int i = 0; i < pab2.length; i++) {
    pab2[i] = new ParallelBatteryy(p1[8], p1[9], ss, p1[0], p1[1], (i*edist), true, false);
  }
}

void resistorBox (int compx1, int compy1, int compx2, int compy2) { //make shape
  stroke(255);
  strokeWeight(15);
  line(compx1, compy1, compx2, compy2);
  stroke(0);
  strokeWeight(1);
}

void parallelCircuit01Components () {
  fill(0);
  text("V1", p1[0]+(3*bs/5), p1[1]+(5*bs/4));
  text("R1", p1[2]-(rs/3), p1[3]+(rs/10));
  text("R2", p1[4]-(rs/3), p1[5]+(rs/10));
  text("R3", p1[6]-(rs/3), p1[7]+(rs/10));
  text("S1", p1[8]+ss, p1[9]+(ss/4));
  fill(255);
  batteryV(p1[0], p1[1]); //draws V1   // needs to be drawn within the execute command
  resistorV(p1[2], p1[3], R1, W1); //R1
  resistorV(p1[4], p1[5], R2, W2); //R2
  resistorV(p1[6], p1[7], R3, W3); //R3
  switchH(p1[8], p1[9], S1); //S1
  pay1[1].parallelWire();
  pay2[1].parallelWire();
  pay3[1].parallelWire();
  pay4[1].parallelWire();
  pay5[1].parallelWire();
  pay6[1].parallelWire();
  pay7[1].parallelWire();
  arrow(V1slidery, p1[0]+(2*bs/3), p1[0]-(2*bs/3), p1[1]+bs, p1[1]); // V1 indicator
  arrow(R1slidery, p1[2]-rs/5, p1[2]+rs/5, p1[3], p1[3]+rs); // R1 indicator
  arrow(R2slidery, p1[4]-rs/5, p1[4]+rs/5, p1[5], p1[5]+rs); // R2 indicator
  arrow(R3slidery, p1[6]-rs/5, p1[6]+rs/5, p1[7], p1[7]+rs); // R3 indicator
  arrow(S1infoy, p1[8]+ss, p1[8], p1[9], p1[9]-ss/2); // S1 indicator
}

void parallelCircuitMaths() {
  parallelCurrent();
  parallelWatts();
}

void Vparallel01R1 () {
  CPP = C01;
  for (int i = 0; i < pay4.length; i++) {
    pay4[i].parallelPowery();
    pay4[i].movey();
  }
  for (int i = 0; i < pay7.length; i++) {
    pay7[i].parallelPowery();
    pay7[i].movey();
  }
}

void Vparallel01R2 () {
  CPP = C02;
  for (int i = 0; i < pay3.length; i++) {
    pay3[i].parallelPowery();
    pay3[i].movey();
  }
  for (int i = 0; i < pay6.length; i++) {
    pay6[i].parallelPowery();
    pay6[i].movey();
  }
}

void Vparallel01R3 () {
  CPP = C03;
  for (int i = 0; i < pay2.length; i++) {
    pay2[i].parallelPowery();
    pay2[i].movey();
  }
  for (int i = 0; i < pay5.length; i++) {
    pay5[i].parallelPowery();
    pay5[i].movey();
  }
}

void Hparallel01R1 () {
  CPP = CP0;
  for (int i = 0; i < pax4.length; i++) {
    pax4[i].parallelPowerx();
    pax4[i].movex();
  }
  for (int i = 0; i < pax7.length; i++) {
    pax7[i].parallelPowerx();
    pax7[i].movex();
  }
  for (int i = 0; i < pab1.length; i++) {
    pab1[i].battP();
    pab1[i].moveBatt();
  }
  for (int i = 0; i < pab2.length; i++) {
    pab2[i].battP();
    pab2[i].moveBatt();
  }
}

void Hparallel01R2 () {
  CPP = C02+C03;
  for (int i = 0; i < pax3.length; i++) {
    pax3[i].parallelPowerx();
    pax3[i].movex();
  }
  for (int i = 0; i < pax6.length; i++) {
    pax6[i].parallelPowerx();
    pax6[i].movex();
  }
}

void Hparallel01R3 () {
  CPP = C03;
  for (int i = 0; i < pax2.length; i++) {
    pax2[i].parallelPowerx();
    pax2[i].movex();
  }
  for (int i = 0; i < pax5.length; i++) {
    pax5[i].parallelPowerx();
    pax5[i].movex();
  }
}

void parallelCircuit01Execute () {
  if (S1 == false) {
    parallelCircuit01Components();
    fill(255,0,0);
    text("Circuit not connected.", 10, 490);
    fill(255);
  }
  else if (S1 == true) {
    parallelCircuit01Components();
    parallelCircuitMaths();

    if (V1 > 0) {
      if (R1 > 0 || R2 > 0 || R3 > 0) {
        pRightDet(); //del if statement if you don't want to dissapear when resistors == 0
      }
      else {
        fill(255,0,0);
        text("Battery is shorted out.", 10, 490);
        fill(255);
      }
      if (R1 > 0 && R2 == 0 && R3 == 0) {
      Vparallel01R1();
      Hparallel01R1();
      resistorBox(p1[4],p1[5], p1[4], p1[5]+rs);
      resistorBox(p1[6],p1[7], p1[6], p1[7]+rs);
      }
      if (R1 > 0 && R2 > 0 && R3 == 0) {
      Vparallel01R1();
      Hparallel01R1();
      Vparallel01R2();
      Hparallel01R2();
      resistorBox(p1[6],p1[7], p1[6], p1[7]+rs);
      }
      if (R1 > 0 && R2 == 0 && R3 > 0) {
      Vparallel01R1();
      Hparallel01R1();
      Hparallel01R2();
      Vparallel01R3();
      Hparallel01R3();
      resistorBox(p1[4],p1[5], p1[4], p1[5]+rs);
      }
      if (R1 > 0 && R2 > 0 && R3 > 0) {
      Vparallel01R1();
      Hparallel01R1();
      Vparallel01R2();
      Hparallel01R2();
      Vparallel01R3();
      Hparallel01R3();
      }
      if (R1 == 0 && R2 > 0 && R3 == 0) {
      Hparallel01R1();
      Vparallel01R2();
      Hparallel01R2();
      resistorBox(p1[2],p1[3], p1[2], p1[3]+rs);
      resistorBox(p1[6],p1[7], p1[6], p1[7]+rs);
      }
      if (R1 == 0 && R2 > 0 && R3 > 0) {
      Hparallel01R1();
      Vparallel01R2();
      Hparallel01R2();
      Vparallel01R3();
      Hparallel01R3();
      resistorBox(p1[2],p1[3], p1[2], p1[3]+rs);
      }
      if (R1 == 0 && R2 == 0 && R3 > 0) {
      Hparallel01R1();
      Hparallel01R2();
      Vparallel01R3();
      Hparallel01R3();
      resistorBox(p1[2],p1[3], p1[2], p1[3]+rs);
      resistorBox(p1[4],p1[5], p1[4], p1[5]+rs);
      }
    }
    else {
      fill(255,0,0);
      text("Not enough power.", 10, 490);
      fill(255);
    }
  }
}

class ParallelCircuity { //used to draw wire in series
  int c1x, c1y, c1s, c2x, c2y;
  float flow;
  float offset;
  float wireend;
  boolean horiz, tops;

  ParallelCircuity(int component1x, int component1y, int component1size, int component2x, int component2y, int seperation, boolean horizontalOrientation, boolean wiredAbove) {
    c1x = component1x;
    c1y = component1y;
    c1s = component1size;
    c2x = component2x;
    c2y = component2y;
    horiz = horizontalOrientation;
    tops = wiredAbove;
    offset = seperation; //distance between electron at the start, and travel speed
  }

  void parallelWire () { //used to draw all wire in series
    if (horiz == true) { //if horiz = true, c1 component is drawn on the horizontal plane
      line(c1x+c1s, c1y, c2x, c1y);  //component 1&2 x&y and component 1's size
      line(c2x, c1y, c2x, c2y);
    }
    else if (horiz == false) { //if horiz = false, c1 component is drawn vertically
      if (tops == true) {
        line(c1x, c1y+c1s, c1x, para);
        line(c1x, para, c2x, para);
        line(c2x, para, c2x, c2y);
      }
      else if (tops == false) {
        line(c1x, c1y+c1s, c1x, 500-para);
        line(c1x, 500-para, c2x, c2y);
      }
    }
  }

  void parallelPowery () { //used to draw electrons in the circuit along vertical wires
    if (tops == true) {
      flow = c2y;
      wireend = para;
      ellipse(c2x+random(-0, 0), flow-this.offset, es, es);
    }
    else if (tops == false) {
      flow = 500-para;
      wireend = c1y+c1s;
      ellipse(c1x+random(-V1, V1), flow-this.offset, es, es);
    }
  }

  void movey () { //moves electrons forward through wire
    if (CPP <=4) {
      if (flow - this.offset < wireend) {
        this.offset = 0;
      }
      else {
        this.offset = this.offset+CPP;
      }
    }
    else if (CPP > 4) { // high end for current flow
      if (flow - this.offset < wireend) {
        this.offset = 0;
      }
      else {
        this.offset = this.offset+4;
      }
    }
  }
}

class ParallelBatteryy { //used to draw wire in series
  int c1x, c1y, c1s, c2x, c2y;
  float flow;
  float offset;
  float wireend;
  boolean horiz, tops;

  ParallelBatteryy(int component1x, int component1y, int component1size, int component2x, int component2y, int seperation, boolean horizontalOrientation, boolean wiredAbove) {
    c1x = component1x;
    c1y = component1y;
    c1s = component1size;
    c2x = component2x;
    c2y = component2y;
    horiz = horizontalOrientation;
    tops = wiredAbove;
    offset = seperation; //distance between electron at the start, and travel speed
  }

  void battP() {
    if (tops == true) {
      flow = para;
      wireend = c1y+c1s;
      ellipse(c1x+random(-0, 0), flow+this.offset, es, es);
    }
    else if (tops == false) {
      if (c1y > c2y) {
        flow = c2y;
        wireend = 500-para;
        ellipse(c2x+random(-V1, V1), flow+this.offset, es, es);
      }
    }
  }

  void moveBatt () { //moves electrons forward through wire
    if (CPP <= 4) {
      if (flow + this.offset > wireend) {
        this.offset = 0;
      }
      else {
        this.offset = this.offset+CPP;
      }
    }
    if (CPP > 4) {
      if (flow + this.offset > wireend) {
        this.offset = 0;
      }
      else {
        this.offset = this.offset+4;
      }
    }
  }
}

class ParallelCircuitx { //used to draw wire in series
  int c1x, c1y, c1s, c2x, c2y;
  float flow;
  float offset;
  float wireend;
  boolean horiz, tops;

  ParallelCircuitx(int component1x, int component1y, int component1size, int component2x, int component2y, int seperation, boolean horizontalOrientation, boolean wiredAbove) {
    c1x = component1x;
    c1y = component1y;
    c1s = component1size;
    c2x = component2x;
    c2y = component2y;
    horiz = horizontalOrientation;
    tops = wiredAbove;
    offset = seperation; //distance between electron at the start, and travel speed
  }

  void parallelPowerx () { //used to draw electrons in the circuit along vertical wires
    if (tops == true) {
      flow = c2x;
      wireend = c2x-125;
      ellipse(flow-this.offset, para+random(-0, 0), es, es);
    }
    else if (tops == false) {
      flow = c1x-125;
      wireend = c1x;
      ellipse(flow+this.offset, (500-para)+random(-V1, V1), es, es);
    }
  }

  void movex () { //moves electrons forward through wire
    if (CPP <= 4) {
      if (tops == true) {
        if (flow - this.offset < wireend) {
          this.offset = 0;
        }
        else {
          this.offset = this.offset+CPP;
        }
      }
      if (tops == false) {
        if (flow + this.offset > wireend) {
          this.offset = 0;
        }
        else {
          this.offset = this.offset+CPP;
        }
      }
    }
    if (CPP > 4) {
      if (tops == true) {
        if (flow - this.offset < wireend) {
          this.offset = 0;
        }
        else {
          this.offset = this.offset+4;
        }
      }
      if (tops == false) {
        if (flow + this.offset > wireend) {
          this.offset = 0;
        }
        else {
          this.offset = this.offset+4;
        }
      }
    }
  }
}


//Following variables required for basic series circuits
int ressize = 6; //resistor distance
int swsize = 3; //switch distance (both this and previous are for electron spacing)
String seriesC1 = "50, 275, 225, 100, 450, 200, 325, 400, 175, 400";  //component initial x/y coords
int [] s1 = int(trim(seriesC1.split(","))); //x/y coords split into individual variables
SeriesCircuity[] sey1 = new SeriesCircuity[(s1[1]-s1[3]+bs)/edist];  //next 10 lines call each wire vertical
SeriesCircuitx[] sex1 = new SeriesCircuitx[(s1[2]-s1[0])/edist]; // and horizontal seperately for the circuit
SeriesCircuity[] sey2 = new SeriesCircuity[(s1[5]-s1[3])/edist];
SeriesCircuitx[] sex2 = new SeriesCircuitx[(s1[4]-s1[2]-rs)/edist];
SeriesCircuity[] sey3 = new SeriesCircuity[(s1[7]-s1[5]-rs)/edist];
SeriesCircuitx[] sex3 = new SeriesCircuitx[(s1[4]-s1[6])/edist];
SeriesCircuity[] sey4 = new SeriesCircuity[6];
SeriesCircuitx[] sex4 = new SeriesCircuitx[(s1[6]-s1[8]+rs2)/edist];
SeriesCircuity[] sey5 = new SeriesCircuity[(s1[9]-s1[1])/edist];
SeriesCircuitx[] sex5 = new SeriesCircuitx[(s1[8]-s1[0]+ss)/edist];
ComponentFlow[] sc1 = new ComponentFlow[rs/edist]; //next four lines call each components
ComponentFlow[] sc2 = new ComponentFlow[rs/edist]; //electrical variables
ComponentFlow[] sc3 = new ComponentFlow[rs/edist];
ComponentFlow[] sc4 = new ComponentFlow[60/edist];

void seriesCircuit01Call() {  //gets values to prep drawing the first series circuit
  for (int i = 0; i < sey1.length; i++) {
    sey1[i] = new SeriesCircuity(s1[0], s1[1], bs, s1[2], s1[3], (i*edist), false);
  }
  for (int i = 0; i < sex1.length; i++) {
    sex1[i] = new SeriesCircuitx(s1[0], s1[1], bs, s1[2], s1[3], (i*edist), false);
  }
  for (int i = 0; i < sey2.length; i++) {
    sey2[i] = new SeriesCircuity(s1[2], s1[3], rs, s1[4], s1[5], (i*edist), true);
  }
  for (int i = 0; i < sex2.length; i++) {
    sex2[i] = new SeriesCircuitx(s1[2], s1[3], rs, s1[4], s1[5], (i*edist), true);
  }
  for (int i = 0; i < sey3.length; i++) {
    sey3[i] = new SeriesCircuity(s1[4], s1[5], rs, s1[6], s1[7], (i*edist), false);
  }
  for (int i = 0; i < sex3.length; i++) {
    sex3[i] = new SeriesCircuitx(s1[4], s1[5], rs, s1[6], s1[7], (i*edist), false);
  }
  for (int i = 0; i < sey4.length; i++) {
    sey4[i] = new SeriesCircuity(s1[6], s1[7], rs2, s1[8], s1[9], (i*edist), true);
  }
  for (int i = 0; i < sex4.length; i++) {
    sex4[i] = new SeriesCircuitx(s1[6], s1[7], rs2, s1[8], s1[9], (i*edist), true);
  }
  for (int i = 0; i < sey5.length; i++) {
    sey5[i] = new SeriesCircuity(s1[8], s1[9], ss, s1[0], s1[1], (i*edist), true);
  }
  for (int i = 0; i < sex5.length; i++) {
    sex5[i] = new SeriesCircuitx(s1[8], s1[9], ss, s1[0], s1[1], (i*edist), true);
  }
  for (int i = 0; i < sc1.length; i++) { // R1
    sc1[i] = new ComponentFlow(s1[2], s1[3], rs, (i*edist), true);
  }
  for (int i = 0; i < sc2.length; i++) { // R2
    sc2[i] = new ComponentFlow(s1[4], s1[5], rs, (i*edist), false);
  }
  for (int i = 0; i < sc3.length; i++) { // R3
    sc3[i] = new ComponentFlow(s1[6], s1[7], rs2, (i*edist), true);
  }
  for (int i = 0; i < sc4.length; i++) { // S1
    sc4[i] = new ComponentFlow(s1[8], s1[9], ss, (i*edist), true);
  }
}

void seriesCircuit01Components() { //draws components and then wires
  text("V1", s1[0]+(3*bs/5), s1[1]+(5*bs/4));
  text("R1", s1[2]-(rs/5), s1[3]-(rs/10));
  text("R2", s1[4]-(rs/3), s1[5]+(rs/10));
  text("R3", s1[6]-rs-(rs/5), s1[7]-(rs/10));
  text("S1", s1[8]+ss, s1[9]+(ss/4));
  batteryV(s1[0], s1[1]); //draws V1   // needs to be drawn within the execute command
  resistorH(s1[2], s1[3], R1, W1); //R1
  resistorV(s1[4], s1[5], R2, W2); //R2
  resistorHB(s1[6], s1[7], R3, W3); //R3
  switchH(s1[8], s1[9], S1); //S1
  sey1[1].seriesWire(); //draws all of the wires
  sey2[1].seriesWire();
  sey3[1].seriesWire();
  sey4[1].seriesWire();
  sey5[1].seriesWire();
  arrow(V1slidery, s1[0]+(2*bs/3), s1[0]-(2*bs/3), s1[1]+bs, s1[1]); // V1 indicator
  arrow(R1slidery, s1[2], s1[2]+rs, s1[3]-rs/5, s1[3]+rs/5); // R1 indicator
  arrow(R2slidery, s1[4]-rs/5, s1[4]+rs/5, s1[5], s1[5]+rs); // R2 indicator
  arrow(R3slidery, s1[6]+rs2, s1[6], s1[7]+rs2/5, s1[7]-rs2/5); // R3 indicator
  arrow(S1infoy, s1[8]+ss, s1[8], s1[9], s1[9]-ss/2); // S1 indicator
}

void seriesCircuitMaths() {
  seriesCurrent();
  seriesVdrop();
  seriesWatts();
}

void seriesCircuit01Execute() {  //controls the circuit by calling the classes
  if (S1 == false) {
    seriesCircuit01Components();
    fill(255,0,0);
    text("Circuit not connected.", 10, 490);
    fill(255);
  }
  else if (S1 == true) {
    seriesCircuit01Components();
    seriesCircuitMaths();
      
    if (V1 > 0) {
      if (R1 > 0 || R2 > 0 || R3 > 0) {
        sRightDet();
        for (int i = 0; i < sey1.length; i++) {
          sey1[i].seriesPowery();
          sey1[i].movey();
        }
        for (int i = 0; i < sex1.length; i++) {
          sex1[i].seriesPowerx();
          sex1[i].movex();
        }
        for (int i = 0; i < sey2.length; i++) {
          sey2[i].seriesPowery();
          sey2[i].movey();
        }
        for (int i = 0; i < sex2.length; i++) {
          sex2[i].seriesPowerx();
          sex2[i].movex();
        }
        for (int i = 0; i < sey3.length; i++) {
          sey3[i].seriesPowery();
          sey3[i].movey();
        }
        for (int i = 0; i < sex3.length; i++) {
          sex3[i].seriesPowerx();
          sex3[i].movex();
        }
        for (int i = 0; i < sey4.length; i++) {
          sey4[i].seriesPowery();
          sey4[i].movey();
        }
        for (int i = 0; i < sex4.length; i++) {
          sex4[i].seriesPowerx();
          sex4[i].movex();
        }
        for (int i = 0; i < sey5.length; i++) {
          sey5[i].seriesPowery();
          sey5[i].movey();
        }
        for (int i = 0; i < sex5.length; i++) {
          sex5[i].seriesPowerx();
          sex5[i].movex();
        }
        for (int i = 0; i < sc1.length; i++) {
          if (V1 > 0 && R1 == 0) {
            sc1[i].cStart();
            sc1[i].cMove();
          }
        }
        for (int i = 0; i < sc2.length; i++) {
          if (V1 > 0 && R2 == 0) {
            sc2[i].cStart();
            sc2[i].cMove();
          }
        }
        for (int i = 0; i < sc3.length; i++) {
          if (V1 > 0 && R3 == 0) {
            sc3[i].cStart();
            sc3[i].cMove();
          }
        }
        for (int i = 0; i < sc4.length; i++) {
          if (V1 > 0) {
            sc4[i].cStart();
            sc4[i].cMove();
          }
        }
      }
      else {
      fill(255,0,0);
      text("Battery is shorted out.", 10, 490);
      fill(255);
      }
    }
    else {
    fill(255,0,0);
    text("Not enough power.", 10, 490);
    fill(255);
    }
  }
}

class ComponentFlow {
  int cx, cy, cs, cend;
  float flow;
  float coffset;
  boolean horiz;

  ComponentFlow(int componentx, int componenty, int componentsize, float seperation, boolean horizontalOrientation) {
    cx = componentx;
    cy = componenty;
    cs = componentsize;
    coffset = seperation;
    horiz = horizontalOrientation;
  }

  void cStart () { //used to draw electrons on the component
    if (horiz == true) {
      if (cs > 0) {
        flow = cx + cs;
        ellipse(flow-this.coffset, cy+random(-V03, V03), es, es);
      }
      else if (cs < 0) {
        flow = cx + cs;
        cend = cx;
        ellipse(flow+this.coffset, cy+random(-V01, V01), es, es);
      }
    }
    else if (horiz == false) {
      if (cs > 0) {
        flow = cy + cs;
        ellipse(cx+random(-V02, V02), flow-this.coffset, es, es);
      }
      else if (cs < 0) {
        flow = cy + cs;
        ellipse(cx+random(-V01, V01), flow+this.coffset, es, es);
      }
    }
  }

  void cMove () {
    if (CS0 <=4) {
      if (horiz == true) {
        if (cs > 0) {
          if (this.coffset > cs) {
            this.coffset = 0;
          }
          else {
            this.coffset = this.coffset+CS0;
          }
        }
        else if (cs < 0) {
          if (this.coffset > -1*cs) {
            this.coffset = 0;
          }
          else {
            this.coffset = this.coffset+CS0;
          }
        }
      }
      else if (horiz == false) {
        if (cs > 0) {
          if (this.coffset > cs) {
            this.coffset = 0;
          }
          else {
            this.coffset = this.coffset+CS0;
          }
        }
        else if (cs < 0) {
          if (this.coffset > -1*cs) {
            this.coffset = 0;
          }
          else {
            this.coffset = this.coffset+CS0;
          }
        }
      }
    }
    else if (CS0 > 4) { // high end for current flow
      if (horiz == true) {
        if (cs > 0) {
          if (this.coffset > cs) {
            this.coffset = 0;
          }
          else {
            this.coffset = this.coffset+4;
          }
        }
        else if (cs < 0) {
          if (this.coffset > -1*cs) {
            this.coffset = 0;
          }
          else {
            this.coffset = this.coffset+4;
          }
        }
      }
      else if (horiz == false) {
        if (cs > 0) {
          if (this.coffset > cs) {
            this.coffset = 0;
          }
          else {
            this.coffset = this.coffset+4;
          }
        }
        else if (cs < 0) {
          if (this.coffset > -1*cs) {
            this.coffset = 0;
          }
          else {
            this.coffset = this.coffset+4;
          }
        }
      }
    }
  }
}


class SeriesCircuity { //used to draw wire in series
  int c1x, c1y, c1s, c2x, c2y;
  float flow;
  float offset;
  float wireend;
  boolean horiz;

  SeriesCircuity(int component1x, int component1y, int component1size, int component2x, int component2y, int seperation, boolean horizontalOrientation) {
    c1x = component1x;
    c1y = component1y;
    c1s = component1size;
    c2x = component2x;
    c2y = component2y;
    horiz = horizontalOrientation;
    offset = seperation; //distance between electron at the start, and travel speed
  }

  void seriesWire () { //used to draw all wire in series
    if (horiz == true) { //if horiz = true, c1 component is drawn on the horizontal plane
      line(c1x+c1s, c1y, c2x, c1y);  //component 1&2 x&y and component 1's size
      line(c2x, c1y, c2x, c2y);
    }
    else if (horiz == false) { //if horiz = false, c1 component is drawn vertically
      line(c1x, c1y+c1s, c1x, c2y);
      line(c1x, c2y, c2x, c2y);
    }
  }

  void seriesPowery () { //used to draw electrons in the circuit along vertical wires
    if (horiz == true) {
      if (c1y > c2y) {
        flow = c2y;
        wireend = c1y;
        ellipse(c2x+random(-V01, V01), flow+this.offset, es, es);
      }
      else if (c1y < c2y) {
        flow = c2y;
        wireend = c1y;
        ellipse(c2x+random(-V03, V03), flow-this.offset, es, es);
      }
    }
    else if (horiz == false) {
      if (c1y > c2y) {
        flow = c2y;
        wireend = c1y+c1s;
        ellipse(c1x+random(-V04, V04), flow+this.offset, es, es);
      }
      else if (c1y < c2y) {
        flow = c2y;
        wireend = c1y+c1s;
        ellipse(c1x+random(-V02, V02), flow-this.offset, es, es);
      }
    }
  }

  void movey () { //moves electrons forward through wire
    if (CS0 <=4) {
      if (c1y > c2y) {
        if (flow + this.offset > wireend) {
          this.offset = 0;
        }
        else {
          this.offset = this.offset+CS0;
        }
      }
      if (c1y < c2y) {
        if (flow - this.offset < wireend) {
          this.offset = 0;
        }
        else {
          this.offset = this.offset+CS0;
        }
      }
    }
    else if (CS0 > 4) { // high end for current flow
      if (c1y > c2y) {
        if (flow + this.offset > wireend) {
          this.offset = 0;
        }
        else {
          this.offset = this.offset+4;
        }
      }
      if (c1y < c2y) {
        if (flow - this.offset < wireend) {
          this.offset = 0;
        }
        else {
          this.offset = this.offset+4;
        }
      }
    }
  }
}

class SeriesCircuitx { //used to draw wire in series
  int c1x, c1y, c1s, c2x, c2y;
  float flow;
  float offset;
  float wireend;
  boolean horiz;

  SeriesCircuitx(int component1x, int component1y, int component1size, int component2x, int component2y, int seperation, boolean horizontalOrientation) {
    c1x = component1x;
    c1y = component1y;
    c1s = component1size;
    c2x = component2x;
    c2y = component2y;
    horiz = horizontalOrientation;
    offset = seperation; //distance between electron at the start, and travel speed
  }

  void seriesPowerx () { //used to draw electrons in the circuit along horizontal wires
    if (horiz == true) {
      if (c1x > c2x) {
        flow = c2x;
        wireend = c1x+c1s;
        ellipse(flow+offset, c1y+random(-V01, V01), es, es);
      }
      else if (c1x < c2x) {
        flow = c2x;
        wireend = c1x+c1s;
        ellipse(flow-offset, c1y+random(-V03, V03), es, es);
      }
    }
    else if (horiz == false) {
      if (c1x > c2x) {
        flow = c2x;
        wireend = c1x;
        ellipse(flow+offset, c2y+random(-V02, V02), es, es);
      }
      else if (c1x < c2x) {
        flow = c2x;
        wireend = c1x;
        ellipse(flow-offset, c2y+random(-V04, V04), es, es);
      }
    }
  }

  void movex () { //moves electrons forward through wire
    if (CS0 <=4) {
      if (c1x > c2x) {
        if (flow + this.offset > wireend) {
          this.offset = 0;
        }
        else {
          this.offset = this.offset+CS0;
        }
      }
      if (c1x < c2x) {
        if (flow - this.offset < wireend) {
          this.offset = 0;
        }
        else {
          this.offset = this.offset+CS0;
        }
      }
    }
    else if (CS0 > 4) { // high end for current flow
      if (c1x > c2x) {
        if (flow + this.offset > wireend) {
          this.offset = 0;
        }
        else {
          this.offset = this.offset+4;
        }
      }
      if (c1x < c2x) {
        if (flow - this.offset < wireend) {
          this.offset = 0;
        }
        else {
          this.offset = this.offset+4;
        }
      }
    }
  }
}


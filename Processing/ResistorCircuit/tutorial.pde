String tutorialC = "50, 275, 225, 100, 450, 200, 325, 400";  //component initial x/y coords
int [] t1 = int(trim(tutorialC.split(","))); //x/y coords split into individual variables
SeriesCircuity[] sety1 = new SeriesCircuity[(s1[1]-s1[3]+bs)/edist];  //next 10 lines call each wire vertical
SeriesCircuitx[] setx1 = new SeriesCircuitx[(s1[2]-s1[0])/edist]; // and horizontal seperately for the circuit
SeriesCircuity[] sety2 = new SeriesCircuity[(s1[5]-s1[3])/edist];
SeriesCircuitx[] setx2 = new SeriesCircuitx[(s1[4]-s1[2]-rs)/edist];
SeriesCircuity[] sety3 = new SeriesCircuity[(s1[7]-s1[5]-rs)/edist];
SeriesCircuitx[] setx3 = new SeriesCircuitx[(s1[4]-s1[6])/edist];
SeriesCircuity[] sety4 = new SeriesCircuity[(s1[7]-s1[1])/edist];
SeriesCircuitx[] setx4 = new SeriesCircuitx[(s1[6]-s1[0]+ss)/edist];
ComponentFlow[] sct1 = new ComponentFlow[rs/edist]; //next four lines call each components
ComponentFlow[] sct2 = new ComponentFlow[rs/edist]; //electrical variables
ComponentFlow[] sct3 = new ComponentFlow[60/edist];

void tutorialCircuitCall() {  //gets values to prep drawing the first series circuit
  for (int i = 0; i < sety1.length; i++) {
    sety1[i] = new SeriesCircuity(t1[0], t1[1], bs, t1[2], t1[3], (i*edist), false);
  }
  for (int i = 0; i < setx1.length; i++) {
    setx1[i] = new SeriesCircuitx(t1[0], t1[1], bs, t1[2], t1[3], (i*edist), false);
  }
  for (int i = 0; i < sety2.length; i++) {
    sety2[i] = new SeriesCircuity(t1[2], t1[3], rs, t1[4], t1[5], (i*edist), true);
  }
  for (int i = 0; i < setx2.length; i++) {
    setx2[i] = new SeriesCircuitx(t1[2], t1[3], rs, t1[4], t1[5], (i*edist), true);
  }
  for (int i = 0; i < sety3.length; i++) {
    sety3[i] = new SeriesCircuity(t1[4], t1[5], rs, t1[6], t1[7], (i*edist), false);
  }
  for (int i = 0; i < setx3.length; i++) {
    setx3[i] = new SeriesCircuitx(t1[4], t1[5], rs, t1[6], t1[7], (i*edist), false);
  }
  for (int i = 0; i < sety4.length; i++) {
    sety4[i] = new SeriesCircuity(t1[6], t1[7], ss, t1[0], t1[1], (i*edist), true);
  }
  for (int i = 0; i < setx4.length; i++) {
    setx4[i] = new SeriesCircuitx(t1[6], t1[7], ss, t1[0], t1[1], (i*edist), true);
  }
  for (int i = 0; i < sct1.length; i++) { // R1
    sct1[i] = new ComponentFlow(t1[2], t1[3], rs, (i*edist), true);
  }
  for (int i = 0; i < sct2.length; i++) { // R2
    sct2[i] = new ComponentFlow(t1[4], t1[5], rs, (i*edist), false);
  }
  for (int i = 0; i < sct3.length; i++) { // R3
    sct3[i] = new ComponentFlow(t1[6], t1[7], ss, (i*edist), true);
  }
}

void tutorialCircuitComponents() { //draws components and then wires
  text("V1", t1[0]+(3*bs/5), t1[1]+(5*bs/4));
  text("R1", t1[2]-(rs/5), t1[3]-(rs/10));
  text("R2", t1[4]-(rs/3), t1[5]+(rs/10));
  text("S1", t1[6]+ss, t1[7]+(ss/4));
  batteryV(t1[0], t1[1]); //draws V1   // needs to be drawn within the execute command
  resistorH(t1[2], t1[3], R1, W1); //R1
  resistorV(t1[4], t1[5], R2, W2); //R2
  switchH(t1[6], t1[7], S1); //S1
  sety1[1].seriesWire(); //draws all of the wires
  sety2[1].seriesWire();
  sety3[1].seriesWire();
  sety4[1].seriesWire();
  arrow(V1slidery, t1[0]+(2*bs/3), t1[0]-(2*bs/3), t1[1]+bs, t1[1]); // V1 indicator
  arrow(R1slidery, t1[2], t1[2]+rs, t1[3]-rs/5, t1[3]+rs/5); // R1 indicator
  arrow(R2slidery, t1[4]-rs/5, t1[4]+rs/5, t1[5], t1[5]+rs); // R2 indicator
  arrow(S1infoy, t1[6]+ss, t1[6], t1[7], t1[7]-ss/2); // S1 indicator
}

void tutorialCircuitExecute() {  //controls the circuit by calling the classes
  if (S1 == false) {
    tutorialCircuitComponents();
    fill(255,0,0);
    text("Circuit not connected.", 10, 490);
    fill(255);
  }
  else if (S1 == true) {
    tutorialCircuitComponents();
    seriesCircuitMaths();
      
    if (V1 > 0) {
      if (R1 > 0 || R2 > 0 || R3 > 0) {
        sRightDet();
        for (int i = 0; i < sety1.length; i++) {
          sety1[i].seriesPowery();
          sety1[i].movey();
        }
        for (int i = 0; i < setx1.length; i++) {
          setx1[i].seriesPowerx();
          setx1[i].movex();
        }
        for (int i = 0; i < sety2.length; i++) {
          sety2[i].seriesPowery();
          sety2[i].movey();
        }
        for (int i = 0; i < setx2.length; i++) {
          setx2[i].seriesPowerx();
          setx2[i].movex();
        }
        for (int i = 0; i < sety3.length; i++) {
          sety3[i].seriesPowery();
          sety3[i].movey();
        }
        for (int i = 0; i < setx3.length; i++) {
          setx3[i].seriesPowerx();
          setx3[i].movex();
        }
        for (int i = 0; i < sety4.length; i++) {
          sety4[i].seriesPowery();
          sety4[i].movey();
        }
        for (int i = 0; i < setx4.length; i++) {
          setx4[i].seriesPowerx();
          setx4[i].movex();
        }
        for (int i = 0; i < sct1.length; i++) {
          if (V1 > 0 && R1 == 0) {
            sct1[i].cStart();
            sct1[i].cMove();
          }
        }
        for (int i = 0; i < sct2.length; i++) {
          if (V1 > 0 && R2 == 0) {
            sct2[i].cStart();
            sct2[i].cMove();
          }
        }
        for (int i = 0; i < sct3.length; i++) {
          if (V1 > 0 && R3 == 0) {
            sct3[i].cStart();
            sct3[i].cMove();
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


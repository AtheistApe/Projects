//Following variables are required for different math functions

float CS0, CS, CP0, CP, C1, C2, C3, C01, C02, C03, CPP; //to calculate currents in the maths section
float V01, V02, V03, V04; //to calculate Voltage values at each section of the circuit
float R1drop; //calculate voltage drop on R1
float R2drop; //calculate voltage drop on R2
float R3drop; //calculate voltage drop on R3
float D1 = 2.2; //voltage drop on LED
float resistancetotal;
float W0, W1, W2, W3;

/* ----------------------------------------------------------
THE FOLLOWING FUNCTIONS ARE USED TO FIGURE OUT VOLTAGE DROPS,
TOTAL CURRENT AND BRANCH CURRENT THROUGHOUT THE CIRCUIT
---------------------------------------------------------- */


//SERIES CIRCUIT FORMULAS//

void seriesCurrent() {
  if (V1 > 0 && R1 > 0 || V1 > 0 && R2 > 0 || V1 > 0 && R3 > 0) {
    float rtotal = R1+R2+R3;
    CS = V1 / rtotal;
    CS0 = CS * 100;
  } else {
    CS = 0;
    CS0 = 0;
  }
}

void seriesWatts () {
  float R01 = R1;
  float R02 = R2;
  float R03 = R3;
  if (R1 > 0) {
    W1 = (CS * CS) * R01;
  }
  else {
    W1 = 0;
  }
  if (R2 > 0) {
    W2 = (CS * CS) * R02;
  }
  else {
    W2 = 0;
  }
  if (R3 > 0) {
    W3 = (CS * CS) * R03;
  }
  else {
    W3 = 0;
  }
  if (R1 > 0 || R2 > 0 || R3 > 0) {
    W0 = W1 + W2 + W3;
  }
  else {
    W0 = 0;
  }
}

void seriesVdrop() {
  if (R1 > 0) {
    R1drop = CS * R1;
  }
  else {
    V04 = 0;
    R1drop = 0;
  }
  if (R2 > 0) {
    R2drop = CS * R2;
  }
  else {
    V03 = 0;
    R2drop = 0;
  }
  if (R3 > 0) {
    R3drop = CS * R3;
  }
  else {
    V02 = 0;
    R3drop = 0;
  }
  V01 = V1;
  V02 = V1 - (R3drop);
  V03 = V1 - (R2drop + R3drop);
  V04 = V1 - (R1drop + R2drop + R3drop);
}


//PARALLEL CIRCUIT FORMULAS//

void parallelWatts () {
  float R01 = R1;
  float R02 = R2;
  float R03 = R3;
  if (R1 > 0) {
    W1 = (V1 * V1) / R01;
  }
  else {
    W1 = 0;
  }
  if (R2 > 0) {
    W2 = (V1 * V1) / R02;
  }
  else {
    W2 = 0;
  }
  if (R3 > 0) {
    W3 = (V1 * V1) / R03;
  }
  else {
    W3 = 0;
  }
  if (R1 > 0 || R2 > 0 || R3 > 0) {
    W0 = W1 + W2 + W3;
  }
  else {
    W0 = 0;
  }
}

void parallelCurrent() {
  float volts = V1;
  if (R1 > 0) {
    C1 = volts / R1;
    C01 = C1 * 100;
  }
  else {
    C1 = 0;
    C01 = 0;
  }
  if (R2 > 0) {
    C2 = volts / R2;
    C02 = C2 * 100;
  }
  else {
    C2 = 0;
    C02 = 0;
  }
  if (R3 > 0) {
    C3 = volts / R3;
    C03 = C3 * 100;
  }
  else {
    C3 = 0;
    C03 = 0;
  }
  CP = C1 + C2 + C3;
  CP0 = CP * 100;
}



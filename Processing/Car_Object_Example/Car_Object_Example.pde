void setup() {
  size(400, 400);
}

class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Car(color c_, float xpos_, float ypos_) {
    c = c_;
    xpos = xpos_;
    ypos = ypos_;
    xspeed = 0.25*random(8)+1;
  }
  
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 20, 10);
  }
  
  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

class Wheel {
  color c;
  float radius;
  float xpos;
  float ypos;
  float rot;
  
  Wheel(color c_, float radius_, float xpos_, float ypos_, float rot_) {
    c = c_;
    radius = radius_;
    xpos = xpos_;
    ypos = ypos_;
    rot = rot_;
  }
}
  

Car myCar1 = new Car(color(255,0,0), 0, 90);
Car myCar2 = new Car(color(0,0,255), 0, 10);
Car myCar3 = new Car(color(0,255,0), 0, 50);


void draw() {
  background(255);
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  myCar3.drive();
  myCar3.display();
}

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Ex09_02 extends PApplet {

// Ex09_02: Classes and objects

PieGrow pie1;
PieGrow pie2;
PieGrow pie3;
PieGrow pie4;
PieGrow pie5;

public void setup() {
  
  

  // PieGrow(title, PI);
  pie1 = new PieGrow("Pie A", 0.75f);
  pie2 = new PieGrow("Pie B", 1.40f);
  pie3 = new PieGrow("Pie C", 1.65f);
  pie4 = new PieGrow("Pie D", 1.95f);
  pie5 = new PieGrow("Pie E", 1.10f);
}

public void draw() {
  background(80);

  pie1.update();
  pie1.display();

  pie2.update();
  pie2.display();

  pie3.update();
  pie3.display();

  pie4.update();
  pie4.display();

  pie5.update();
  pie5.display();
}
class PieGrow {

  // Declare variables
  float x;
  float y;
  float d;
  float angleStart;
  float angleMid;
  float angleEnd;
  float speed;
  float r;
  float g;
  float b;
  String title;

  // Constructor to set initial values
  PieGrow(String titleTemp, float angleEndTemp) {
    d = random(50, 250);
    x = random(d/2, width - d/2);
    y = random(d/2, height - d/2);
    angleStart = 0;
    angleMid = 0;
    angleEnd = angleEndTemp * PI;
    speed = random(0.005f, 0.05f);
    r = random(255);
    g = random(255);
    b = random(255);
    title = titleTemp;
  }

  // Update fields
  public void update() {
    angleMid += speed;
    angleMid = constrain(angleMid, 0, angleEnd);

    if((dist(x, y, mouseX, mouseY) < d/2) && mousePressed) {
      x = x + (mouseX - pmouseX);
      y = y + (mouseY - pmouseY);
    }
  }

  // Draw the arc
  public void display() {
    noStroke();
    fill(r, g, b);
    arc(x, y, d, d, 0, angleMid);
    fill(0);
    text(title, x+5, y+15);
  }
}
  public void settings() {  size(600, 200);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex09_02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

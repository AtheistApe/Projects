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

public class Ex05_02 extends PApplet {
  public void setup() {
// Ex05_02: 'perlan noise' randomness.

int n = 100;
int x;
float y = 0.05f;
float noiseY;


background(255);
stroke(100);

for(int i = 1; i < n; i++) {
  y += 0.02f;
  x = i * (width/n);
  noiseY = noise(y) * height;
  line(x, height, x, noiseY);
}
    noLoop();
  }

  public void settings() { 
size(600, 200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex05_02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

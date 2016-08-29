import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Ex05_03 extends PApplet {
  public void setup() {
// Ex05_03: shuffle items in an array using Java

 // import java.util library

Integer[] nums = {1, 2, 3, 4, 5}; // calling java's integer creation type
println(nums);

Collections.shuffle(Arrays.asList(nums));
println(nums);
    noLoop();
  }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex05_03" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

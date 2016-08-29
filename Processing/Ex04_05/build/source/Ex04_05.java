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

public class Ex04_05 extends PApplet {
  public void setup() {
// Ex04_05

// Original
int[] a = {7, 0, 4};
// println(a);

// copy
int[] b = new int[a.length];
println(b);
arrayCopy(a,b);
println(b);

// sort
a = sort(a);
println(a);

// reverse
int[] bRev = reverse(b);
println(bRev);

// append
a = append(a, 8);
println(a);

// splice
b = splice(b, 10, 2);
println(b);

// concatenate
int[] c = concat(a, b);
println(c);
    noLoop();
  }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex04_05" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

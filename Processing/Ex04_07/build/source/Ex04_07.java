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

public class Ex04_07 extends PApplet {
  public void setup() {
// Ex04_07

// trim()
String quote = "     To be or not to be.        ";
quote = trim(quote);
println(quote);

// nf() "number format"
int a = 798;
println(a);

String A = nf(a, 3);
println(A);

A = nf(a, 10);
println(A);
    noLoop();
  }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ex04_07" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

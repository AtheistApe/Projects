// Ex04_04

// Manually create an array
//int[] a = {100, 200, 300, 400};
//println("The five values in a[], from 0-4, are:");
//println(a);

// fill in an empty array
int[] b = new int[3];

println("\nb[] has not yet been filled in, so its default values are:");
println(b);
b[0] = 3;
b[1] = 6;
b[2] = 9;

println("\nNow the values of b[] are:");
println(b);

size(600, 200);
background(255);
smooth();
stroke(100, 50);

int n = 1000;
float[] xTop = new float[n];
float[] xBottom = new float[n];

for(int i = 0; i < n; i++) {
  xTop[i] = random(50, 550);
  xBottom[i] = random(50, 550);
  line(xTop[i], 25, xBottom[i], 175);
}
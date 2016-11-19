#include <stdio.h>
#include <string.h>
#include <math.h>

float mult(float x, float y) {
  return x*y;
}

typedef struct {
  float x;
  float y;
} Point;

float length(Point p) {
  return sqrt(p.x * p.x + p.y * p.y);
}

// Point p;
// float len;

int main(int argc, char **argv) {
  Point p;
  float len;

  float prod = mult(3.71, 4.968);
  printf("The product is %f\n\n", prod);

  p.x = 3.0;
  p.y = 10.0;
  len = length(p);
  printf("The length is %f", len);
}

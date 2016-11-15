#include <stdio.h>

int i;

int hello_world_1(int n) {
  for (i = 1; i <= n; i++){
    puts("Hello World!");
  }
  return 0;
}

int hello_world_2(int n){
  int k = 1;
  while (k <= n){
    puts("Hello World!");
    k++;
  }
  return 0;
}

int main(int argc, char** argv) {

  hello_world_1(5);
  puts("");
  hello_world_2(2);
}

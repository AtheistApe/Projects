#include <stdio.h>

int main(int argc, char** argv) {

  int hello_world_1(int n) {
    for (int i = 1; i <= n; i++){
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

  hello_world_1(3);
  puts("");
  hello_world_2(4);
}

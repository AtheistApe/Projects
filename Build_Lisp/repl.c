#include <stdio.h>
#include <stdlib.h> /* Provides the 'free' function */

#include <editline/readline.h> /* To allow for command line editing */
#include <editline/history.h> /* To allow for a command history */

int main(int argc, char** argv) {

  /* Print Version and Exit Information */
  puts("Lispy Version 0.0.0.0.1");
  puts("Press Ctrl+c to Exit\n");

  /* In a never ending loop... */
  while(1) {
    /* Output our prompt and get input */
    char* input = readline("lispy> ");

    /* Add input to history */
    add_history(input);

    /* Echo input back to the user */
    printf("No you're a %s\n", input);

    /* Free retrieved input */
    free(input);
  }

  return 0;
}

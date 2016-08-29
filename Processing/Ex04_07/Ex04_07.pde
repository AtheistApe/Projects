// Ex04_07

// trim()
String quote = "     To be or not to be.        ";
quote = trim(quote);
println(quote);

// nf() "number format"
int a = 798;
println(a);

String A = nf(a, 3); // convert integer 'a' to a string.
println(A);

A = nf(a, 10);
println(A);

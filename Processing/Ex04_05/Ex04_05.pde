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

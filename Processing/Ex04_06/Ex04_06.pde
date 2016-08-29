// Ex04_06

// Manually entering test
String deerHunterOntology = "This is this. It's not something else. This is this.";
//println(deerHunterOntology);

size(600, 200);
smooth();
background(#eeeeee);
fill(#000000);
//textSize(100);
text(deerHunterOntology, 100, 140);

String poemLines[] = loadStrings("Szymborska.txt");
println(poemLines[0]);
println(poemLines[1]);
println(poemLines[2]);
println(poemLines[3]);
println(poemLines[5]);
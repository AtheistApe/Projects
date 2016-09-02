var bgcolor;
var button1;
var button2;
var slider;
var nameInput;
var nameP;

function setup() {
  canvas = createCanvas(200,200);
  canvas.mouseOver(overpara);
  canvas.mouseOut(outpara);

  bgcolor = color(200);

  nameP = createP('Your name');
  nameP.mouseOver(overpara);
  nameP.mouseOut(outpara);

  button1 = createButton("Change background color");
  button1.mousePressed(changeBgColor);

  createP('');

  button2 = createButton("Change circle color");
  button2.mousePressed(changeCircColor);

  createP('');

  slider = createSlider(10, 100, 47);

  nameInput = createInput('Enter your name:')
  // nameInput.changed(updateText);
  nameInput.input(updateText);
}

function overpara() {
  nameP.html("Your mouse is over me");
}

function outpara() {
  nameP.html("Your mouse is not over me");
}

function updateText() {
  nameP.html(nameInput.value());
}

function changeBgColor() {
  bgcolor = color(random(0, 150));
}

function changeCircColor() {
  fill (random(255), random(255), random(255));
}

// function mousePressed() {
//   changeColor();
// }

function draw() {
  background(bgcolor);
  // fill(changeRectColor());
  ellipse(100, 100, slider.value(), slider.value());

  text(nameInput.value(), 10, 20);
  // nameP.html(input.value());
}

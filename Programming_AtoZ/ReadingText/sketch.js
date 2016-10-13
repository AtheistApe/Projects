var textfield;
var output;

function setup() {
  noCanvas();
  textfield = createInput();

  textfield.changed(newText);
  textfield.input(newTyping);
  output = select('#output');
}

function newTyping() {
  output.html(textfield.value());
  // createP(textfield.value());
  // console.log(textfield.value());
}

function newText() {
  createP(textfield.value());
}

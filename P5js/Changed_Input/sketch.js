var textbox;
var slider;
var paragraph;

function setup() {
  noCanvas();
  textbox = createInput("enter text");
  slider = createSlider(10, 64, 16);
  paragraph = createP('starting text');

  // textbox.changed(doSomething); //Must hit 'return' to trigger
  textbox.input(updateText); //Triggers as soon as changes occur.
  slider.input(updateSize);
}

function updateSize() {
  paragraph.style("font-size", slider.value()+"pt");
}

function updateText() {
  paragraph.html(textbox.value());
}

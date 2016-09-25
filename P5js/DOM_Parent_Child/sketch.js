var happy = ['rainbow', 'unicorn', 'purple', 'bacteria'];

function setup() {
  var canvas = createCanvas(400, 400);
  canvas.parent('canvasp')

  var button = select('#button')
  button.mousePressed(addItem);
}

function addItem() {
  var r = floor(random(0, happy.length));
  var li = createElement('li', happy[r]);
  li.parent('happylist');
}
function draw() {
  background(0);
  ellipse(200, 200, random(90,100), random(90,100));
}

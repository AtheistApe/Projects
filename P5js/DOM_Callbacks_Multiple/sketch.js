var paragraphs;
var paragraph;

function setup() {
  createCanvas(200,100);
  background(0)

  paragraph = select('#unicorn');
  // paragraph.mouseOver(highlight);
  // paragraph.mouseOut(unhighlight);
  
  for (var j = 0; j < 100; j++) {
    var par = createP('Gary');
    par.position(random(500), random(500));
  }
  paragraphs = selectAll('p');
  // paragraphs = selectAll('.rainbow');
  
  for (var i = 0; i < paragraphs.length; i++) {
    paragraphs[i].mouseOver(highlight);
    paragraphs[i].mouseOut(unhighlight);
  }
}

// Use the 'this' keyword to apply a style to all elements
// of a particular DOM element.

function highlight() {
  this.style('background-color', '#F0F');
  // this.style('padding', '16pt');
}

function unhighlight() {
  // this.style('padding', '0pt');
  this.style('background-color', '#FFF');
}

function changeBackground() {
  paragraph.style('background-color', '#F0F');
}

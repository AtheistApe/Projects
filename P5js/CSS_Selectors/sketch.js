var paragraph;
var paragraphs;

function setup() {
  createCanvas(100,100);
  background(0);

  /* 'select' on a tag or class will select first element of the page
/* that matches the selector. 'selectAll' will select all elements
/* that match the selector on the page. 'selectAll' returns an array
/* of type elements indicated by the selector. To apply styling to all
/* the returned elements, use a loop.*/

  // paragraph = select('#unicorn');
  // paragraph = select('p');
  paragraph = select('.rainbow');
  // paragraphs = selectAll('p');
  paragraphs=selectAll('.rainbow');

  for (var i = 0; i < paragraphs.length; i++) {
    paragraphs[i].style('font-size', '24pt');
  }

  paragraph.mouseOver(changeBackground);

  var button = select('#button');
  button.mousePressed(canvasBg);
}

function changeBackground() {
  paragraph.style('background-color', '#F00');
}

function canvasBg() {
  background(random(255));
}

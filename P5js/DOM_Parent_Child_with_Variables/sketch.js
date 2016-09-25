var images = [];

function setup() {
  noCanvas();
  var links = ['apples', 'bananas', 'blueberries',
    'strawberries', 'oranges', 'pineapples'];

  for (var i = 0; i < links.length; i++) {
    p = createP('This is a link: ');
    p.style('background-color', '#CCC');
    p.style('padding', '24pt');

    var a = createA('#', links[i]);
    a.mousePressed(addPhoto);

    a.parent(p);
  }

  var button = select('#clear');
  button.mousePressed(clearImages);
}

function clearImages() {
  for (var i = 0; i < images.length; i++) {
    images[i].remove(); // removes element from page
  }
  images = [];
}

function addPhoto() {
  // The 'createImg' function creates an HTML DOM
  // element '<img src="<element>"', where <element>
  // could be a file or a URL.

  var img = createImg('apple.jpg');
  images.push(img);
  // 'this' refers to the DOM element that
  // triggered the callback. Here, the anchor
  // triggers the callback so the image becomes
  // a child of the anchor. However, would like
  // the image to be a child of the paragraph even
  // though it is triggered by the anchor.

  // img.parent(this);

  // To get the parent of a DOM element use that
  // elements 'parent' method called without arguments.

  var paragraph = this.parent();
  img.parent(paragraph);
  img.size(50, 50);
}

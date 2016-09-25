function setup() {
  for (var i = 0; i < 10; i++) {
    var p = createP('apples');
    var x = floor(random(windowWidth));
    var y = floor(random(windowHeight));
    p.position(x, y);
    p.class('apple');
  }

  for (var i = 0; i < 10; i++) {
    // 'createA' makes anchor elements (links) to websites
    // '#' symbol instructs that functionality will be handled
    // by code.

    // var p = createA('http://google.com');
    var p = createA('#', 'blueberry');
    var x = floor(random(windowWidth));
    var y = floor(random(windowHeight));
    p.position(x, y);
    p.class('blueberry')
    p.mousePressed(becomeApple);
  }
}

function becomeApple() {
  // To remove an object from a class, use 'removeClass'.
  // A DOM element can be a member of multiple classes.
  
  // this.removeClass('blueberry');
  this.class('apple');
}
function draw() {

}

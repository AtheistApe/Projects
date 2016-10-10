var endColor;
var startColor;
var betweenColor;

var timer = 500;
var startTime = timer;

function setup() {
  createCanvas(600, 400);
  startColor = color('green');
  endColor = color('red');
  // txt = text(circleColor, width/2, 3*height/4 + 60);
  
  // circleColor = randomColor();

  // fill(circleColor);
  // fill('red');
  // ellipse(width/2, height/2, 100, 100);
  
  // randomColor();
}

function randomColor() {
  var greenRange = Math.floor(Math.random()*271).toString(16);
  greenRange = ("0" + greenRange).slice(-2);
  textSize(20);
  rangeTxt = text("greenRange: " + greenRange, width/2, 3*height/4);
  colorTxt = text("colorTxt: " + '#FF'+greenRange+'00', width/2, 3*height/4 + 30);

  return('#FF'+ greenRange + '00');
}

function draw() {
    background(255);
    circleColor = lerpColor(startColor, endColor, (startTime - timer)/startTime);
    fill(circleColor);
    ellipse(width/2, height/2, 100, 100);
    textSize(20);
    // str = (100*floor(circleColor + (startColor - circleColor)*50/100)).toString()
    // console.log(str)
    // str = "This is a string";
    txt = text(circleColor, width/2, 3*height/4 + 60);
    timer--;
    // noLoop();
}

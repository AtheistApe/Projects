// Modification of Daniel Shiffman's original Flow Field sketch
// to allow for a time-varying flowfield.

// Via Reynolds: http://www.red3d.com/cwr/steer/FlowFollow.html

// Using this variable to decide whether to draw all the stuff
var debug = true;
var toff = 0;

// Flowfield object
var flowfield;
// An ArrayList of vehicles
var vehicles = [];

function setup() {

  var canvas = createCanvas(640, 360);
  canvas.parent('https://accounts.smccd.edu/churchg/index.html/sketch-holder');
  // Make a new flow field with "resolution" of 16
  flowfield = new FlowField(20);
  // Make a whole bunch of vehicles with random maxspeed and maxforce values
  for (var i = 0; i < 120; i++) {
    vehicles.push(new Vehicle(random(width), random(height), random(2, 5), random(0.1, 0.5)));
  }
}

function draw() {
  background(51);
  toff += 0.005;
  flowfield.update(); // Changes the direction of the flow vectors.
  // Display the flowfield in "debug" mode
  if (debug) flowfield.display();
  // Tell all the vehicles to follow the flow field
  for (var i = 0; i < vehicles.length; i++) {
    vehicles[i].follow(flowfield);
    vehicles[i].run();
  }

}


function keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}

// Make a new flowfield
function mousePressed() {
  flowfield.init();
}

var video;

function setup() {
  createCanvas(320, 240);
  background(51);
  video = createCapture(VIDEO);
  video.size(320, 240);
  video.hide();
}

function draw() {
  tint(255, 0, 100);
  image(video, 0, 0, width, height);
  // fill(255, 0, 0, 100);
  // ellipse(160, 120, 50, 50);
}

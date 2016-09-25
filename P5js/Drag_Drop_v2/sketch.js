function setup() {
  var canvas = createCanvas(200, 200);
  background(0);

  canvas.drop(gotFile);
}

function gotFile(file) {
  createP(file.name + " " + file.size);
  // createP(file.type);
  // createP(file.size);
  var img = createImg(file.data);
  // img.size(100, 100);
  img.hide();

  image(img, 0, 0, width, height);
}

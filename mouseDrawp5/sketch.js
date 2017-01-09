function setup() {
  createCanvas(displayWidth, displayHeight);
}

function draw() {
  fill(random(255),random(255),255,127);
  ellipse(mouseX, mouseY, 10, 10);
}

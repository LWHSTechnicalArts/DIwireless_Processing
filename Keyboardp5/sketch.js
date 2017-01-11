var speed = 10;
var x = 100;
var y = 100;

function setup() {
    createCanvas(800, 600);
    background(255);
}

function draw() {
    fill(255,255,100);
    ellipse(x, y, 10, 10);
}

function keyPressed() {
    if (keyCode == RIGHT_ARROW) {
        x+=speed
    }
    if (keyCode == LEFT_ARROW) {
        x-=speed

    }
    if (keyCode == DOWN_ARROW) {
        y+=speed
    }
    if (keyCode == UP_ARROW) {
        y-=speed
    }
    if (keyCode == '65') {   // A Key clears screen
        background(255);
    }
}

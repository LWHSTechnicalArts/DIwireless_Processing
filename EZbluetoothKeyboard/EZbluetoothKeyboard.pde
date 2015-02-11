/* bluetooth keyboard test for use with: 
https://learn.adafruit.com/introducing-bluefruit-ez-key-diy-bluetooth-hid-keyboard/overview
hook a button to PIN 6 on Bluetooth device */

void setup() {
  size(640, 360);
  noStroke();
  background(0);
}

void draw() { 
  // keep draw() here to continue looping while waiting for keys
}

void keyPressed() {
  if (key == '1') {                 //draws 10 rects per press
    for (int i =0; i<10; i++) {
      fill(255,100,0,100);
      rect(random(0, width), random(0, height), 50, 50);
    }
  }
}


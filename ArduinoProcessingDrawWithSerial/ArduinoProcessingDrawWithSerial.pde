// * Simple Arduino Draw

import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port

void setup() 
{
  size(800, 500);
  //Processing function to print serial ports
  println(Serial.list());

  //Listing the available serial ports with a for loop!!
  for (int i = 0; i < Serial.list ().length; i++) {
    println(i + " --> " + Serial.list()[i]);
  }
  
  String portName = Serial.list()[9];
  myPort = new Serial(this, portName, 9600);
  background(0, 125, 100);
}

void draw()
{
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.read();         // read it and store it in val
  }

  if (val == 'H') {              // If the serial value is 0,
    ellipseMode(CENTER);            //draw ellipse from center
    fill(random(255), 255, 255, 150);
    ellipse(random(width), random(width), 100, 100);
  } else {                       // If the serial value is not 0,
    pushMatrix();
    translate(width/2, 0);
    rectMode(CENTER);
    rotate(QUARTER_PI);
    fill(255, 255, random(255), 150);
    rect(random(width), random(width), 50, 50);
    popMatrix();
  }
}


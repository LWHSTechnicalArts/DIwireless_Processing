import processing.serial.*;     // import the Processing serial library

int linefeed = 10;              // Linefeed in ASCII
Serial myPort;                  // The serial port
float x=0;
float y=0;
float z=0;
float xpos2, ypos2;

void setup() {
  size(1300, 800);  // Stage size
  // List all the available serial ports
   for (int i = 0; i < Serial.list ().length; i++) {
    println(i + " --> " + Serial.list()[i]);
  }
  myPort = new Serial(this, Serial.list()[3], 9600);

  // read bytes into a buffer until you get a linefeed (ASCII 10):
  myPort.bufferUntil(linefeed);
  background(255);
  xpos2 = width/2;
  ypos2 = height/2;
  beginShape();
}

void draw() {
  background(255);
  stroke(100, 200);
  fill(255,0,0);
  ellipse(x, y,100,100);
}

// serialEvent  method is run automatically by the Processing applet
// whenever the buffer reaches the  byte value set in the bufferUntil() 
// method in the setup():

void serialEvent(Serial myPort) { 
  // read the serial buffer:
  String myString = myPort.readStringUntil(linefeed);

  // if you got any bytes other than the linefeed:
  //if (myString != null) {

    myString = trim(myString);

    // split the string at the commas
    // and convert the sections into integers:
    int sensors[] = int(split(myString, ','));
    x = map(sensors[1], 13, 254, 0, width);
    y = map(sensors[0], 5, 254, 0, height);
    z = map(sensors[2], 0, 254, 10, .1);
    // print out the values you got:
    for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
      print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
    }
    // add a linefeed after all the sensor values are printed:
    println();
  //}
}


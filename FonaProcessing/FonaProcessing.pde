import processing.serial.*;     // import the Processing serial library

int linefeed = 10;              // Linefeed in ASCII
Serial myPort;                  // The serial port

float x=0;
float y=0;

String newMessage;
String myString;

float size;
PFont font;

void setup() {
  printArray(PFont.list());                //list computer fonts
  font = createFont("Verdana-Bold", 32);   //load a font
  textFont(font);

  size(1200, 600);
  background(125);
  fill(0, 200, 0);

  printArray(Serial.list());
  String portName = Serial.list()[7];                 //change this number to match your Serial port
  myPort = new Serial(this, portName, 9600);
  // read bytes into a buffer until you get a linefeed (ASCII 10):
  myPort.bufferUntil(linefeed);
}

void draw() {
  if (myString != null && newMessage!=myString) { 
    String splitMessage = myString;    
    String[] words = split(splitMessage, ' ');   //split the string into individual words
    size = (height/(words.length+2));              //text size is determined by dividing number of words by height
    textAlign(CENTER);
    background(0);

    y = (height/2) - ((size * words.length)/2) + size;     //this centers the text vertically based on number of words

    for (int i=0; i<words.length; i++) { 
      if (textWidth(words[i])>width) {                  //keeps short messages from being too big
        size=size-25;
      }
      textSize(size); 
      fill(random(255), random(255), random(255));
      text(words[i], width/2, y + (i*size));            //prints words on canvas
    }
    newMessage=myString;   //used to see when new message comes in
  }
}

void serialEvent(Serial mySerial) { 
  // read the serial buffer:
  myString = mySerial.readStringUntil(linefeed);
}
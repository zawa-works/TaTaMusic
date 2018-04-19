import  processing.serial.*;
import processing.sound.*;
SoundFile []file = new SoundFile[3];

Serial  myPort;

int []init_data = new int [3];
boolean init = true;
int []data = new int [3];
String [] pos = {"right", "bottom", "left"};
boolean []isPlay = new boolean[3];
int NUM = 3;


void setup() {  
  size(400, 250);
  myPort = new Serial( this, Serial.list()[0], 9600 );

  for (int i=0; i<3; i++)file[i] = new SoundFile(this, sketchPath("tatoba/"+i+".mp3"));

  for (int i=0; i<NUM; i++)isPlay[i] = true;
}

void draw() {
  background(0);
  //塗りを白に
  fill(255);
  //入力の数だけ繰り返し
  for (int i=0; i<2; i++) {
    text(pos[i]+"= " + data[i], 20, 20 * i + 40);

    if (!isPlay[i] && data[i] < 945) {
      isPlay[i] = true;
      continue;
    }

    if (isPlay[i] && data[i] > 945 && i<2) {
      println(i + "is play");
      file[i].play();

      isPlay[i] = false;
    }
  }

  text(pos[2]+"= " + data[2], 20, 20 * 2 + 40);


  if (!isPlay[2] && data[2] < 980) {
    isPlay[2] = true;
  }

  if (isPlay[2] && data[2] > 980) {
    println(3 + "is play");
    file[2].play();

    isPlay[2] = false;
  }
}

void serialEvent(Serial p) {  
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    inString = trim(inString);
    data = int(split(inString, ','));
  }
}
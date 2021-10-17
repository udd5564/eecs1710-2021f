float rSeconds = 0;
float rMinutes = 0;
float rHours = 0;
int lSecond = 0;
int lMinute = 0;
int lHour = 0;

float faceSize = 500;
float lengthSecondHand = 220;
float lengthMinuteHand = 200;
float lengthHourHand = 100;

color oColor = color(50);
color sColor = color(105,0,0);
color fColor = color(100, 200, 150);

void setup() {
  size(800, 600, P2D); 
  strokeWeight(1);
}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();
  
  if (s != lSecond) {
    rSeconds = ((float) s / 60) * TWO_PI;
    lSecond = s;
  }
  
  if (m != lMinute) {
    rMinutes = ((float) m / 60) * TWO_PI; 
    lMinute = m;
  }
  
  if (h != lHour) {
    rHours = ((float) h / 12) * TWO_PI;  
    println(h);
    lHour = h;
  }
  
  fill(fColor);
  stroke(oColor);
  ellipse(width/2, height/2, faceSize, faceSize);
  
  stroke(0, 127, 255, 44);
  for(int i=0; i<12; i++) {
    float rot = ((float) i/12) * TWO_PI;
    pushMatrix();
    translate(width/2, height/2);
    rotate(rot);
    line(0, faceSize/5, 0, faceSize/2);
    popMatrix();
  }
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rSeconds);
  fill(sColor);
  stroke(sColor);
  line(0, 0, 0, -lengthSecondHand);
  ellipse(0, -lengthSecondHand, 10,10);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rMinutes);
  fill(0);
  stroke(oColor);
  line(0, 0, 0, -lengthMinuteHand);
  ellipse(0, -lengthMinuteHand, 10,10);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rHours);
  line(0, 0, 0, -lengthHourHand);
  ellipse(0, -lengthHourHand, 10,10);
  popMatrix();
  
  fill(fColor);
  ellipse(width/2, height/2, 10, 10);
}

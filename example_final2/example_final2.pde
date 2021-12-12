import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song;
AudioInput input;
FFT fft;

int ys = 20;
int yi = 20;
int circleX, circleY;
int circleSize = 30;

boolean overCircle = false;
color bColor = color(0);
color circleColor = color(102, 153, 255);
boolean playing = false;
String text =" ";

Oscil[] oscil = new Oscil[10];

void setup(){
 size (400, 400, P3D);
 minim = new Minim(this);
 song = minim.loadFile("Spring Day - BTS.mp3");
fft = new FFT(song.bufferSize(), song.sampleRate());
 
 circleX = width/2;
 circleY = height/2;
 ellipseMode(BOTTOM);
 textSize(10);
 
 for(int i=0; i < oscil.length; i++) {
   oscil[i] = new Oscil();
 }
}

void draw(){
 background(0);
 smooth();
 
 int y = ys;
 fill(125);
noStroke();
  
  update (mouseX, mouseY);
  
  if (overCircle) {
    cursor(HAND);
    circleColor = color(153, 202, 202);
  } else {
   cursor(ARROW);
   circleColor = color (102, 153, 255);
  }
  
  stroke(255);
  for(int i=0; i < song.bufferSize()-1; i++){
   line(i, 50+ song.left.get(i)*50, i+1, 50 +song.left.get(i*1)*50);
   line(i, 50+ song.right.get(i)*50, i+1, 50 +song.right.get(i*1)*50);
  }
  
  noStroke();
  fill(circleColor);
  ellipse(circleX, circleY, circleSize, circleSize);

  
  textSize(20);
  fill(255);
  text(text, width/2 - textWidth(text)/2, height-100);
    
 for(int i = 0; i< oscil.length; i++){
  oscil[i].move();
  oscil[i].display();
 }
 
}

class Oscil {
  
  PVector pos = new PVector (random (50, width-50), random(50, height-50));
  PVector velocity = new PVector(random (50, width-50), random(50, height-50));
  PVector amplitude = new PVector(130, 130);
  
  void move(){
    pos.add(velocity);
    
  }
  
  void display(){
   
    float x = sin(pos.x) * amplitude.x;
    float y = sin(pos.y) * amplitude.y;
    
    pushMatrix();
    translate(width/2, height/2);
    fill(#DBA350);
    line(0,0,x,y);
    for(int i = 0; i < song.bufferSize()-1; i++){
      stroke(255, 255- (song.right. get(i)*200), 255 - (song.left.get(i)*200));
      ellipse(x, y, 25+(song.right.get(i)*5), 25+(song.left.get(i)*50));
    }
    popMatrix();
  }
  
}
void mousePressed(){
  if(overCircle){
   playing = !playing;
   if(playing){
    song.play(255);
  
    text= "Playing...";
   } else {
   song.pause();
   
   text = "Paused";
   }
  }
}
void update(int x, int y){
  if(overCircle (circleX, circleY, circleSize)){
   overCircle = true;
  } else {
   overCircle = false; 
  }
}

boolean overCircle(int x, int y, int diameter){
  float disX = x -mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) +sq(disY)) < diameter/2) {
   return true; 
  } else {
    return false;
  }
}

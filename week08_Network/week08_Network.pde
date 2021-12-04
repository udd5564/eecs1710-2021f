import oscP5.*;
import netP5.*;

String ipNumber = "255. 255. 240. 0";
int receivePort = 5354;
int sendPort = 5354;
OscP5 oscP5;
NetAddress myRemoteLocation;

String channel = "test";

Button button;

PFont font;
int fontSize = 18;
color receiveOff = color (255, 255, 0);
color receiveOn = color (255, 0, 0);
color receiveNow = receiveOff;
float sizeOff = 100;
float sizeOn = 110;
float sizeNow = sizeOff;

float oscSendData = 0;
float oscReceiveData = 0;

void setup() {
 size (500, 500, P2D);
 
 oscSetup();
 
 button = new Button(width/3, height/2, 150, color (255, 0, 255), fontSize, "Send", "ellipse");
 font = createFont ("Arial", fontSize);
 
}

void draw(){
 background(127);
 
 fill(0);
 textAlign(CENTER);
 textFont (font, fontSize);
 text("OSC Send", width/4, fontSize*1.5);
 text("OSC Receiver", (width/4)+(width/2),fontSize*1.5);
 
 button.update();
 
 if(oscReceiveData > 0.5){
   sizeNow = sizeOn;
   receiveNow = receiveOn;
 } else {
 sizeNow = sizeOff;
 receiveNow = receiveOff;
 }
 
 fill(receiveNow);
 rect((width/4)+(width/2),height/2,sizeNow,sizeNow);
}

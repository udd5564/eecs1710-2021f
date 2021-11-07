import processing.sound.*;

SoundFile file;

void setup(){
 size(500, 600);
 background(100);
 
 file = new SoundFile(this, "cat.mp3");
 
 file.loop();
}

void draw(){
  background (150);
  
  float playbackSpeed = map(mouseX, 0, width, 1, 4.0);
  file.rate(playbackSpeed);
  
  float amplitude = map(mouseY, 0, width, 0.25, 2.0);
  file.amp(amplitude);
  
  float panning = map(mouseY, 0, height, -1.0, 1.0);
  file.pan(panning);
}

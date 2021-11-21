import processing.video.*;

Capture video;

void setup() {
  size(640, 480);
  
  video = new Capture(this, 640, 480);
  video.start();
}

void captureEvent(Capture video) {
  
  video.read();
}

void draw() {
  
  loadPixels();
  video.loadPixels();
  
  for(int i = 0; i < video.width; i++) {
    for(int j = 0; j < video.height; j++) {
      
      int loc = i + j * video.width;
      
      float a = red(video.pixels[loc]);
      float b = green(video.pixels[loc]);
      float e = blue(video.pixels[loc]);
      float d = dist(i, j, mouseX, mouseY);
      float factor = map(d, 0, 100, 2, 0);
      
      a *= factor;
      b *= factor;
      e *= factor;
      
      a = constrain(a, 0, 255);
      b = constrain(b, 0, 255);
      e = constrain(e, 0, 255);
      
      color c = color(a, b, e);
      pixels[loc] = c;
   
}
  }
 updatePixels();
}
 

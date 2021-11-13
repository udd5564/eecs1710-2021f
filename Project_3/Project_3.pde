PImage flw;
ArrayList<Dot> dots;
int scaler =15;

void setup() {
  size(20,20);
  flw = loadImage("flower.jpg");
  flw.resize(700,700);
  surface.setSize(flw.width, flw.height);
  
  flw.loadPixels();
  dots = new ArrayList<Dot>();

  for (int x = 0; x < flw.width; x += scaler) {
    for (int y = 0; y < flw.height; y += scaler) {
      int loc = x + y * (flw.width);
      
      dots.add(new Dot(x, y, flw.pixels[loc]));
    }
  }
}

void draw() { 
  background(255, 255, 0);
  
  for (Dot dot : dots) {
    dot.run();
  }
  
  surface.setTitle("" + frameRate);
}

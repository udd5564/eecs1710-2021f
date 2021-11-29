Effect effect;

PImage img;
PGraphics graphics;

void setup(){
 size(800, 800, P2D);
 img = loadImage("olaf.jpg");
 graphics = createGraphics (img.width, img.height, P2D);
 effect= new Effect(200, 200, 255);
}

void draw() {
  background(127);
  noStroke();
  image(img, 60, 40);
  effect.grayGraphics();
  effect.circles();
}

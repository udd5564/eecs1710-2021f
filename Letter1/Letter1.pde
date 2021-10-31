PImage c, l, a;
String input = "c";

LetterGenerator lg1, lg2, lg3;

void setup() {
  size(800, 600, P2D);
  
  c = loadImage("c.bmp.png");
  l = loadImage("l.bmp.png");
  a = loadImage("a.bmp.png");
  c.resize(200,300);
  l.resize(200, 300);
  a.resize(300,400);
  lg1 = new LetterGenerator("c", 0, 0);
  lg2 = new LetterGenerator("l", 300, 50);
  lg3 = new LetterGenerator("a", 600, 50);
}

void draw() {
  background(225);
  
  lg1.draw();
  lg2.draw();
  lg3.draw();
}

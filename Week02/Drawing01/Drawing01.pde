color bgColor = color(100, 0, 255);
float circleSize = 50;

void setup() {
  size(800, 600, P2D); // P2D enables 2D GPU acceleration
  background(bgColor);
}

void draw() {  
  if (mousePressed) {
    ellipseMode(CENTER);
    fill(150, 220, 50);
    stroke(150, 50, 50);
    line(mouseX, mouseY, pmouseX, pmouseY);
    rect(mouseX, mouseY, circleSize, circleSize);
  }
}

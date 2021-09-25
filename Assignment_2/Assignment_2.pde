void setup() {
  size(400, 400);
  background(0);
}

void draw() {
  for (int x = 0; x < width/40; x = x + 1) {
  for (int y=0; y < height/40; y = y + 1) {
      fill(random(255), random(255), random(255));
      rect(x * 40, y * 40, 40, 40);
    }
  }
  delay(100);
}

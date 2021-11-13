class Dot {

  PVector position, target;
  color col;
  float speed;
  float dotSize;
  
  Dot(float x, float y, color col1) {
    position = new PVector(x, y);
    target = new PVector(random(width), random(height));
    col = col1;
    
    float b = brightness(col) / 255;
    speed = b / 2500;
    dotSize = abs(20 - (b * 20)) + 3;
  }
  
  void update() {
    position.lerp(target, speed);
  }
  
  void draw() {
    stroke(col);
    strokeWeight(dotSize);
    point(position.x, position.y);
  }
  
  void run() {
    update();
    draw();
  }

}

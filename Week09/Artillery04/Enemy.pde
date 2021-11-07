class Enemy extends Sprite {
  
  boolean isLeft;
  PVector target;
  color col = color(random(127)+127, random(127)+127, random(127)+127);
  float movementSpeed = 0.01;
  float xMargin = 500;
  float yMargin = 150;
  boolean alive = true;
  PVector enemySize = new PVector(150, 40);
  
  Enemy() {   
    super("enemy", 12, 0, 0);
    
    float pickSide = random(1);
    float y = random(yMargin, height-yMargin*2);
    float x1, x2;
    if (pickSide < 0.5) {
      isLeft = true;
      scale.x *= -1;
      x1 = -xMargin;
      x2 = width + xMargin;
    } else {
      isLeft = false;
      x1 = width + xMargin;
      x2 = -xMargin;
    }
    position = new PVector(x1, y);  

    target = new PVector(x2, y);  
  }
  
  void update() {
    super.update();
    
    if (position.dist(target) < 5) alive = false;
    
    for (Bullet bullet : cannon.bullets) {
      if (alive && hitDetectRect(position, bullet.position, enemySize)) {
        enemiesKilled++;
        alive = false;
        explosions.add(new Explosion(position.x, position.y));
        soundExplosion.rate(random(0.6, 0.8));
        soundExplosion.jump(0);
      }
    }
    
    if (alive) position.lerp(target, movementSpeed);   
  }
  
  void draw() {
    super.draw();
    
    if (debug) {
      fill(debugColor);
      noStroke();
      ellipse(position.x, position.y, 10, 10);
      
      stroke(debugColor);
      noFill();
      rect(position.x, position.y, enemySize.x, enemySize.y);
    }    
  }
  
  void run() {    
    update();
    draw();
  }
    
}

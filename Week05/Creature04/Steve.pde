class Steve {

  SteveMode mode;
  boolean debug = false;
  PVector position, target, mousePos;
  PImage faceCurrent, face01, face02, face03, face04;
  float margin = 50;
  int foodChoice;
  Eye eyeL, eyeR;
  float eyeSize = 40;
  int eyeMarkTime = 0;
  int eyeTimeout = 200;
  float eyeAngle = 0;
  
  boolean isBothered = false;
  int botheredMarkTime = 0;
  int botheredTimeout = 3000; // Processing measures time in milliseconds
  float botheredSpread = 5;
  
  boolean isBlinking = false;
  int blinkMarkTime = 0;
  int blinkTimeout = 4000;
  int blinkDuration = 250;
  
  boolean isHunting = false;
  
  float triggerDistance1 = 100;
  float triggerDistance2 = 25;
  float movementSpeed = 0.08;
      
  // This is the constructor; it needs to have the same name as the class.
  Steve(float x, float y) {
    mode = SteveMode.NEUTRAL;
    
    position = new PVector(x, y);
    eyeL = new Eye(-45, -20, eyeSize);
    eyeR = new Eye(45, -20, eyeSize);
    
    pickEscapeTarget();
    
    face01 = loadImage("face01.png");
    face01.resize(face01.width/3, face01.height/3);
    face02 = loadImage("face02.png");
    face02.resize(face01.width, face01.height);
    face03 = loadImage("face03.png");
    face03.resize(face01.width, face01.height);
    face04 = loadImage("face04.png");
    face04.resize(face01.width, face01.height);
    
    faceCurrent = face01;    
  }
  
  void update() {
    int t = millis();
    
    mousePos = new PVector(mouseX, mouseY);
    
    if (t > eyeMarkTime + eyeTimeout) {
      eyeMarkTime = t;
      eyeAngle = atan2(mouseY - position.y, mouseX - position.x);
    }


    isBothered = position.dist(mousePos) < triggerDistance1;
    
    if (isBothered) {
      isHunting = false;
      botheredMarkTime = t;
      faceCurrent = face02; // worried expression
      if (position.dist(target) < triggerDistance2) {
        pickEscapeTarget();
      }
    } else if (!isBothered && t > botheredMarkTime + botheredTimeout) {
      if (!isBlinking && t > blinkMarkTime + blinkTimeout) {
        isBlinking = true;
        blinkMarkTime = t;
      } else if (isBlinking && t > blinkMarkTime + blinkDuration) {
        isBlinking = false;
      }
  
      if (isBlinking) {
        faceCurrent = face04; // blink with happy expression
      } else {
        faceCurrent = face03; // happy expression
      }   
      
      // Steve heads toward food if happy
      if (!isHunting) {
        pickFoodTarget();
        isHunting = true;
      }
    } else if (!isBothered && t > botheredMarkTime + botheredTimeout/6) {
      faceCurrent = face01; // neutral expression
    }
  
    if (isBothered || isHunting) {
      position = position.lerp(target, movementSpeed).add(new PVector(random(-botheredSpread, botheredSpread), random(-botheredSpread, botheredSpread)));
    }
    
    if (isHunting && position.dist(target) < 5) {
      foods[foodChoice].alive = false; 
      pickFoodTarget();
    }
    
    position.y += sin(t) / 2;
  }
  
  void draw() {    
    ellipseMode(CENTER);
    rectMode(CENTER);
    imageMode(CENTER);
  
    pushMatrix();
    translate(position.x, position.y);
    image(faceCurrent, 0, 0);

    if (!isBlinking && !isBothered) {
      eyeL.run(eyeAngle);
      eyeR.run(eyeAngle);
    }
    popMatrix();
  
    if (debug) {
      noFill();
      stroke(0, 255, 0);
      ellipse(position.x, position.y, triggerDistance1*2, triggerDistance1*2);
      ellipse(position.x, position.y, triggerDistance2*2, triggerDistance2*2);
      line(target.x, target.y, position.x, position.y);
      stroke(255, 0, 0);
      rect(target.x, target.y, 10, 10);
    }
  }
  
  void run() {
    update();
    draw();
  }
  
  void pickEscapeTarget() {
    target = new PVector(random(margin, width-margin), random(margin, height-margin));
  }
  
  void pickFoodTarget() {
    foodChoice = int(random(foods.length));
    if (foods[foodChoice].alive) {
      target = foods[foodChoice].position;
    }
  }
  
}

enum SteveMode {
  NEUTRAL,
  BOTHERED,
  HUNTING,
  HAPPY
}

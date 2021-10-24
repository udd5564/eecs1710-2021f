int xPos, yPos;
int xDir, yDir;

int padX, padWidth;

int brickRow = 2, brickColumn = 10;
int [][] bricks = new int[brickRow][brickColumn];

boolean dead, play;

void setup () {
  size (500, 400);
  bgimgInit();
  newGameSetup();
}

void draw(){
  drawGameBoard();
  
  if(dead) {
    text("DEAD!!, Click to play again", 10, height/2);
    if(mousePressed == true) {
      newGameSetup();
    }
  }
 
 if(play) {
   ballMoving();
   padMoving();
   bounceCollision();
 }
}

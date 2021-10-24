void newGameSetup(){
  int i, j;
  
  xPos = width /2;
  yPos = height /2;
  padX = width/2;
  padWidth = 250;
  
  dead = false;
  play = true;
  
  for(i=0; i<brickRow; i++)
  for(j=0; j<brickColumn; j++)
  {
    bricks[i][j] = 1;
  }
  xDir = 3;
  yDir = 4;
  
  fill (255);
  strokeWeight(3);
  stroke(255);
}

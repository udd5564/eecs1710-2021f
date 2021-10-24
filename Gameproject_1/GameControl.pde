void bounceCollision(){
  if (xPos < 10 || xPos > width-10) xDir *= -1;
  if(yPos < 40) {
    if( bricks[yPos/20][xPos/50] == 1) {
      yDir *= -1;
      bricks[yPos/20][xPos/50] = 0;
    }
    else if (yPos < 0) yDir *= -1;
  }
  
  if(yPos>height-50 && xPos>=padX && xPos<=padX+padWidth) {
    yDir *= -1;
  }
  
  if( yPos > height-10) {
    dead = true;
    play = false;
  }
}

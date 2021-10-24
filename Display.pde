PImage bgimg;

void bgimgInit(){
  bgimg = loadImage("palace.jpg");
}

void bgimgDraw(){
  image(bgimg, 0, 0);
  bgimg.resize(500,400);
}

void drawGameBoard(){
  int i,j;
  
  bgimgDraw();
  
  stroke(0);
  for(i=0; i<brickRow; i++)
  for(j=0; j<brickColumn; j++) {
    if( bricks[i][j] == 1) rect(j*50, i*20, 50, 20);
  }
}

void ballMoving(){
  ellipse(xPos, yPos, 20, 20);
  
  xPos += xDir;
  yPos += yDir;
}

void padMoving (){
  stroke(5);
  strokeWeight(4);
  padX = mouseX;
  line(padX, height-50, padX+padWidth, height-50);
}

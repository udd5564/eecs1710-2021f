class Effect{
  float circleX, circleY;
  float tempX, tempY, tempColor;
  float grayX;
  
  Effect(float tempX,float tempY, float tempColor){
   circleX = tempX;
   circleY = tempY;
   grayX = tempColor;
  }
  
  void circles(){
   ellipse(circleX, 600, 20, 20); 
  }
  
  void grayGraphics() {
   fill(grayX, 0, 0);
   
   if(mousePressed && mouseY < 650 && mouseY> 550 && mouseX< circleX+40 && mouseX > circleX - 40){
    pushMatrix();
    graphics.beginDraw();
    graphics.image(img,0,0);
    graphics.filter(GRAY);
    graphics.endDraw();
    image(graphics, 60, 40);
    popMatrix();
   }
  }
}

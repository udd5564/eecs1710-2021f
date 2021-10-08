
void setup(){
  size(300, 400);
  background(200, 255, 100);
  }


void draw(){
   smooth();
     strokeWeight(2);
  rect(95, 110, 40, 65);//body
  
  ellipse (115, 90, 40, 40); //head
  ellipse(105, 85, 10, 10); //eye-L
   ellipse(105, 85, 2, 2); //eyeball-L
  ellipse(125, 85, 10, 10);//eye-R
  ellipse(125, 85, 2, 2);//eyeball-R
  
  
  line(105, 100, 125, 100); //moouth
  line (135, 110, 160, 150);//arm-R
  line(95, 110, 70, 150);//arm-L
    line(102, 176,90, 214); //leg-R
  line(127, 176, 139, 214);//leg-L
  
  
  }

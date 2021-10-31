class LetterGenerator {
  
  String input;
  PVector position;
  PImage img;
  color col;
  LetterGenerator(String _input, float x, float y) {
    input = _input;
    position = new PVector(x, y);
 

    switch(input) {
      case "c":
        img = c;
        break;
      case "l":
        img = l;
        break;
      case "a":
        img = a;
        break;
    }
  }

  
  void draw() {
    // shadow
    tint(0, 127);
    image(img, position.x + 10, position.y + 10);
    
    tint(col);
    image(img, position.x, position.y);
    noTint();
    
  }

}

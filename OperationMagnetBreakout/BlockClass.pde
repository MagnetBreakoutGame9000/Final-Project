class Block {

  //float location vector
  PVector loc;
  
  //float width and height variables
  float wd;
  float ht;
  
  //float health variable
  float health;
  
  //float color variable
  float r;
  float g;
  float b;

  //create the block with variables for its health and its r, g, and b color values
  Block(int x, int y, int h) {
    loc = new PVector(x, y);

    //define the width and height of
    wd = 55;
    ht = 20;

    //assign the value "h" to its health
    health = h;

    if (h == 5) {
      r = 150;
      g = 0;
      b = 255;
    } else if (h == 4) {
      r = 0;
      g = 0;
      b = 255;
    } else if (h == 3) {
      r = 0;
      g = 255;
      b = 0;
    } else if (h == 2) {
      r = 255;
      g = 255;
      b = 0;
    } else if (h == 1) {
      r = 255;
      g = 0;
      b = 0;
    }
  }

  void display() {
    //color block
    fill(r, g, b);
    stroke(0);
    //draw block centered on given point
    rect(loc.x-(wd/2), loc.y-(ht/2), wd, ht);
  }

  boolean hasPowerUp() {
    float number = random(100);
    number = round(number);
    if (number < 10) {
      println("YES!");
      return true;
    } else {
      return false;
    }
  }
}
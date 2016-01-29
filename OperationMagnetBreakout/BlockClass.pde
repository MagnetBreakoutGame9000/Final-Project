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
    
    //if the block has 5 health, color it purple
    if (h == 5) {
      r = 150;
      g = 0;
      b = 255;
    //if the block has 4 health, color it blue
    } else if (h == 4) {
      r = 0;
      g = 0;
      b = 255;
    //if the block has 3 health, color it green
    } else if (h == 3) {
      r = 0;
      g = 255;
      b = 0;
    //if the block has 2 health, color it yellow
    } else if (h == 2) {
      r = 255;
      g = 255;
      b = 0;
    //if the block has 1 health, color it red
    } else if (h == 1) {
      r = 255;
      g = 0;
      b = 0;
    }
  }

  //draw the block
  void display() {
    //color block
    fill(r, g, b);
    stroke(0);
    //draw block centered on given point
    rect(loc.x-(wd/2), loc.y-(ht/2), wd, ht);
  }

  //create boolean to determine if the bloc has a power-up
  boolean hasPowerUp() {
    //create a random-number generator to generate a 10% chance of the boolean returning true
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
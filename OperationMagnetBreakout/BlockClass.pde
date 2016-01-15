class Block {

  //float location, width, height, and color variables
  PVector loc;
  float wd;
  float ht;
  float health;
  float r;
  float g;
  float b;
  color c;

  //create the block with variables for its health and its r, g, and b color values
  Block(int h) {

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
    
    //define the color of the block with the r, g, and b values to be imputted by the user
    c = color(r, g, b);
  }

  void display(float x, float y) {
    //color block
    fill(c);
    stroke(0);
    //draw block centered on given point
    rect(x-(wd/2), y-(ht/2), wd, ht);
  }
}
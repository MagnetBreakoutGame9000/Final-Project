class Block {

  //float location, width, height, and color variables
  PVector loc;
  float wd;
  float ht;
  float health;
  color c;

  Block(float r, float g, float b, float h) {
    
    wd = 55;
    ht = 20;
    
    health = h;
    
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
class Paddle {
  //define location vector and variables for base- and height-size
  PVector loc;
  int b;
  int h;

  Paddle() {
    //define location vector and base- and height-size
    loc = new PVector(width/2, height-h);
    b = 100;
    h = 20;
  }
  
  //create function to draw the apddle at the loc vector
  void display() {
    fill(255);
    rect(loc.x, loc.y, b, -h);
  }

  //create function to move the paddle
  void move() {
    //if the left arrow is pressed, move the paddle left; if the right arrow is pressed, move the paddle right
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == RIGHT) {
          loc.x += 5;
        }
        if (keyCode == LEFT) {
          loc.x -= 5;
        }
      }
    }
  }
}
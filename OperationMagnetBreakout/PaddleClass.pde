class Paddle {
  PVector loc;
  int b;
  int h;

  Paddle() {
    loc = new PVector(width/2, 4.7*height/5-h);
    b = 100;
    h = 20;
  }

  void display() {
    fill(255);
    rect(loc.x, loc.y, b, -h);
  }

  void move() {
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
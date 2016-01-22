class Ball {
  PVector loc;
  PVector vel;
  int diam;
  Ball(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(3, 4);
    diam = 20;
  }

  void display() {
    ellipse(loc.x, loc.y, diam, diam);
  }

  void move() {
    loc.add(vel);
  }

  void bounce() {
    if (loc.y - diam/2 <= 0) {
      vel.y *= -1;
    }
    if (loc.y + diam/2 >= 4.7*height/5) {
      vel.y *= -1;
    }
    if (loc.x - diam/2 <= 0) {
      vel.x *= -1;
    }
    if (loc.x + diam/2 >= width) {
      vel.x *= -1;
    }
  }

  boolean isInContactWith(Paddle pad) {
    if (loc.y + diam/2 >= pad.loc.y - pad.h && loc.x >= pad.loc.x && loc.x <= pad.loc.x + pad.b) {
      return true;
    } else {
      return false;
    }
  }
}
class Ball {
  PVector loc;
  PVector vel;
  int diam;
  float top;
  float right;
  float bottom;
  float left;
  Ball(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(3, 4);
    diam = 20;
    top = loc.y - diam/2;
    right = loc.x + diam/2;
    bottom = loc.y + diam/2;
    left = loc.x - diam/2;
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
    if (loc.y + diam/2 >= height) {
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

  boolean isTouchingTopOrBottom(Block b2) {
    if ((loc.x >= b2.loc.x && loc.x <= b2.loc.x + b2.wd && loc.y - diam/2 <= b2.loc.y + b2.ht) || (loc.x >= b2.loc.x && loc.x <= b2.loc.x + b2.wd && loc.y + diam/2 >= b2.loc.y)) {
      return true;
    } else {
      return false;
    }
  }

  boolean isTouchingLeftOrRight(Block b2) {
    if ((loc.y >= b2.loc.y && loc.y <= b2.loc.y + b2.ht && loc.x >= b2.loc.x) || (loc.y >= b2.loc.y && loc.y <= b2.loc.y + b2.ht && loc.x <= b2.loc.x + b2.wd)) {
      return true;
    } else {
      return false;
    }
  }
}
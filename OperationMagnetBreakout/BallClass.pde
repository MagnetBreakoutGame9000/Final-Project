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

  boolean isInContactWith(Paddle p) {
    if ((loc.y >= height - p.h) && (loc.x >= p.loc.x - p.b/2) && (loc.x <= p.loc.x + p.b/2)) {
      return true;
    }
  }
}
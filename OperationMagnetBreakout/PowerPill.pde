class Pill { //<>//
  //create vectors for location and velocity
  PVector loc;
  PVector vel;

  //create integer for the pill's diameter
  int diam;

  Pill(float x, float y) {
    //initialize the location (defined by the variables in the expression above) and the velocity
    loc = new PVector(x, y);
    vel = new PVector(0, 1);

    //initialize the diameter of the pill
    diam = 15;
  }

  //create function to show the pill
  void display() {
    ellipse(loc.x, loc.y, diam, diam);
  }

  //create function to make the pill fall
  void move() {
    loc.add(vel);
  }

  //create boolean to detect whether the paddle is in contact wit
  boolean isCollectedBy(Paddle pad) {
    if (loc.y + diam >= pad.loc.y - pad.h && loc.x >= pad.loc.x && loc.x <= pad.loc.x + pad.b) {
      return true;
    } else {
      return false;
    }
  }
}
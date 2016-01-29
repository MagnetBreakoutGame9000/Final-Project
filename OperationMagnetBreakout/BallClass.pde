class Ball {
  //float PVectors for the location and velocity of the ball
  PVector loc;
  PVector vel;
  
  //float integers for the diameter and red, green, and blue color values
  int diam;
  int r;
  int g;
  int bl;
  
  //create class with floated variables x and y
  Ball(float x, float y) {
    //define location as PVector at coordinates x and y
    loc = new PVector(x, y);
    //define velocity as PVector with coordinates 3, 5
    vel = new PVector(3, 4);
    
    //define the diameter as 20
    diam = 20;
    
    //set initial color to white
    r = 255;
    g = 255;
    bl = 255;
  }
  //draw the ball
  void display() {
    //color the ball with red, green , and blue values
    fill(r,g,bl);
    
    //
    ellipse(loc.x, loc.y, diam, diam);
  }

  //move the ball
  void move() {
    //add the velocity to the location to move the ball
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
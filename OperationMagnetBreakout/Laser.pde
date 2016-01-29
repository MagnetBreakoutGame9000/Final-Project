class Laser {
  //declare vectors for the velocity and location of the laser
  PVector loc;
  PVector vel;
  
  //declare variables for the width and height of the laser
  float wd;
  float ht;
  
  //create laser with floated variables x and y
  Laser(float x, float y){
    //define location as a vector at coordinates x and y
    loc = new PVector(x, y);
    
    //define velocity as a vector with coordinates 0 and -30
    vel = new PVector(0,-30);
    
    //define the width and height of the laser
    wd = 5;
    ht = 50;
  }
  
  //draw the laser by coloring it red and drawing it at the location of the loc vector
  void display(){
    fill(255,0,0);
    rect(loc.x, loc.y, wd, ht);
  }
  
  //make the laser move by adding the velocity vector to the location vector
  void move(){
    loc.add(vel);
  }
  
  //if the area inside the laser is in contact with the area inside a block, return TRUE
  boolean isInContactWith(Block b2){
    if(dist(0,loc.y, 0, b2.loc.y + b2.ht) <= 10 && loc.x > b2.loc.x - b2.wd/2 && loc.x + wd < b2.loc.x + b2.wd/2){
      return true;
    } else {
      return false;
    }
  }
}
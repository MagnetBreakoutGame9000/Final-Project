class Laser {
  PVector loc;
  PVector vel;
  float wd;
  float ht;
  Laser(float x, float y){
    loc = new PVector(x, y);
    vel = new PVector(0,-30);
    wd = 5;
    ht = 50;
  }
  void display(){
    fill(255,0,0);
    rect(loc.x, loc.y, wd, ht);
  }
  void move(){
    loc.add(vel);
  }
  boolean isInContactWith(Block b2){
    if(dist(0,loc.y, 0, b2.loc.y + b2.ht) <= 10 && loc.x > b2.loc.x - b2.wd/2 && loc.x + wd < b2.loc.x + b2.wd/2){
      return true;
    } else {
      return false;
    }
  }
}
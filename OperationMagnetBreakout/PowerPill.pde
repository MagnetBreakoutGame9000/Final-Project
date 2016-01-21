class Pill {
 PVector loc;
 PVector vel;
 int diam;

 Pill(float x, float y) {
   loc = new PVector(x, y);
   vel = new PVector(0, 1);
   diam = 15;
 }

 void display() {
   ellipse(loc.x, loc.y, diam, diam);
 }
  
 void move(){
   loc.add(vel);
 }
  
 boolean isCollectedBy(Paddle pad) {
   if (loc.y + diam >= pad.loc.y - pad.h && loc.x >= pad.loc.x && loc.x <= pad.loc.x + pad.b) {
     return true;
   } else {
     return false;
   }
 }
}
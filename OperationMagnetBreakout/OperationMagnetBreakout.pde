Paddle p;
Ball b;

void setup() {
  size(1100, 700);
  p = new Paddle();
  b = new Ball(width/2, height/2);
  background(0);
}

void draw() {
  background(0);
  p.move();  //move paddle according to player input
  p.display();  //display paddle
  b.move();  //move ball
  b.display();  //display ball
  b.bounce();
  /*if(b.isInContactWith(Paddle p)){
    b.vel.x *= -1;
  }*/
  //if(b.loc.y >= height - p.h && b.loc.x >= p.loc.x - p.b/2 && b.loc.x <= p.loc.x + p.b/2){
    //b.vel.y *= -1;
  //}
}
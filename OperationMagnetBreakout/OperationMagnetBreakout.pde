Paddle p;  //initialize object from the Paddle class
Ball b;  //initialize object from the Ball class

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
  if (b.isInContactWith(p)) {
    b.vel.y *= -1;
    println(b.loc.x - p.loc.x);
    if(b.loc.x - p.loc.x < p.b/4){
      b.vel.x -= 3;
    }
    else if(b.loc.x - p.loc.x >= p.b/4 && b.loc.x - p.loc.x < p.b/2){
      b.vel.x = -b.vel.x;
    }
    else if(b.loc.x - p.loc.x >= p.b/2 && b.loc.x - p.loc.x < 3*p.b/4){
      b.vel.x = b.vel.x;
    }
    else if(b.loc.x - p.loc.x >= 3*p.b/4 && b.loc.x - p.loc.x <= p.b){
      b.vel.x += 3;
    }
    //b.vel.x = 1 - 2*(p.loc.x - b.loc.x)/(p.b/2);
  }
}
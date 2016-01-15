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
  if (b.isInContactWith(p)) {
    b.vel.y *= -1;
    println(b.loc.x - p.loc.x);
    if(b.loc.x - p.loc.x < p.b/3){
      b.vel.x -= 3;
    }
    else if(b.loc.x - p.loc.x >= p.b/3 && b.loc.x - p.loc.x < 2*p.b/3){
      b.vel.x = b.vel.x;
    }
    else if(b.loc.x - p.loc.x >= 2*p.b/3 && b.loc.x - p.loc.x <= p.b){
      b.vel.x += 3;
    }
    b.vel.x = 1 - 2*(p.loc.x - b.loc.x)/(p.b/2);
  }
}
//create arraylists for each row of block
ArrayList<Block> bi;
ArrayList<Block> bii;
ArrayList<Block> biii;
ArrayList<Block> biv;
ArrayList<Block> bv;

Paddle p;  //initialize object from the Paddle class
Ball b;  //initialize object from the Ball class

void setup() {
  //define size of canvas
  size(1100, 700);
  
  p = new Paddle();
  b = new Ball(width/2, height/2);
  
  //define arraylists after the size has been defined
  bi = new ArrayList<Block>();
  bii = new ArrayList<Block>();
  biii = new ArrayList<Block>();
  biv = new ArrayList<Block>();
  bv = new ArrayList<Block>();
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


  //create first row of blocks
  if (bi.size() < 20) {
    bi.add(new Block(5));
  }
  for (int i = bi.size() - 1; i >= 0; i--) {
    Block b1 = bi.get(i);
    b1.display((b1.wd/2) + (i*b1.wd), (b1.ht/2));
  }

  //create second row of blocks
  if (bii.size() < 20) {
    bii.add(new Block(4));
  }
  for (int i = bii.size() - 1; i >= 0; i--) {
    Block b2 = bii.get(i);
    b2.display((b2.wd/2) + (i*b2.wd), (3*b2.ht/2));
  }
 
  //create third row of blocks
  if (biii.size() < 20) {
    biii.add(new Block(3));
  }
  for (int i = biii.size() - 1; i >= 0; i--) {
    Block b3 = biii.get(i);
    b3.display((b3.wd/2) + (i*b3.wd), (5*b3.ht/2));
  }
  
  //create fourth row of blocks
  if (biv.size() < 20) {
    biv.add(new Block(2));
  }
  for (int i = biv.size() - 1; i >= 0; i--) {
    Block b4 = biv.get(i);
    b4.display((b4.wd/2) + (i*b4.wd), (7*b4.ht/2));
  }
  
  //create fifth row of blocks
  if (bv.size() < 20) {
    bv.add(new Block(1));
  }
  for (int i = bv.size() - 1; i >= 0; i--) {
    Block b5 = bv.get(i);
    b5.display((b5.wd/2) + (i*b5.wd), (9*b5.ht/2));
  }
}
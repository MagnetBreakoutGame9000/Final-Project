ArrayList<Block> b;
ArrayList<Block> bo;
ArrayList<Block> bg;
ArrayList<Block> bq;
ArrayList<Block> bw;

void setup() {
  size(1100, 700);
  b = new ArrayList<Block>();
  bo = new ArrayList<Block>();
  bg = new ArrayList<Block>();
  bq = new ArrayList<Block>();
  bw = new ArrayList<Block>();
}

void draw() {
  background(0);

  //create first row of blocks
  if (b.size() < 20) {
    b.add(new Block(240, 0, 0, 1));
  }

  for (int i = b.size() - 1; i >= 0; i--) {
    Block b1 = b.get(i);
    b1.display((b1.wd/2) + (i*b1.wd), (b1.ht/2));
  }

  //create second row of blocks
  if (bo.size() < 20) {
    bo.add(new Block(0, 240, 0, 2));
  }

  for (int i = b.size() - 1; i >= 0; i--) {
    Block b2 = bo.get(i);
    b2.display((b2.wd/2) + (i*b2.wd), (3*b2.ht/2));
  }
  
  //create third row of blocks
  if (bg.size() < 20) {
    bg.add(new Block(0, 0, 240, 2));
  }

  for (int i = b.size() - 1; i >= 0; i--) {
    Block b3 = bg.get(i);
    b3.display((b3.wd/2) + (i*b3.wd), (5*b3.ht/2));
  }
  
  //create fourth row of blocks
  if (bq.size() < 20) {
    bq.add(new Block(240, 0, 0, 2));
  }

  for (int i = b.size() - 1; i >= 0; i--) {
    Block b4 = bq.get(i);
    b4.display((b4.wd/2) + (i*b4.wd), (7*b4.ht/2));
  }
  
  //create fifth row of blocks
  if (bw.size() < 20) {
    bw.add(new Block(0, 240, 0, 2));
  }

  for (int i = b.size() - 1; i >= 0; i--) {
    Block b5 = bw.get(i);
    b5.display((b5.wd/2) + (i*b5.wd), (9*b5.ht/2));
  }
}
ArrayList<Block> b;
ArrayList<Block> bg;

void setup() {
  size(1100, 700);
  b = new ArrayList<Block>();
  bg = new ArrayList<Block>();
}

void draw() {
  background(0);

  //create a new block instance
  if (b.size() < 20) {
    b.add(new Block(25, 90, 250));
  }

  for (int i = b.size() - 1; i >= 0; i--) {
    Block b1 = b.get(i);
    b1.display((b1.wd/2) + (i*b1.wd), (b1.ht/2));
  }

  if (bg.size() < 20) {
    bg.add(new Block(250, 20, 40));
  }

  for (int i = b.size() - 1; i >= 0; i--) {
    Block b2 = bg.get(i);
    b2.display((b2.wd/2) + (i*b2.wd), (3*b2.ht/2));
  }
}
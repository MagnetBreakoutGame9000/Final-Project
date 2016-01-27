//create arraylists for each row of block
ArrayList<Block> bi;

//create arraylist for power pills
ArrayList<Pill> q;

//create arraylist for laser
ArrayList<Laser> li;

PImage heart; //declare variable for the hearts
int menu;   //starting menu =  menu 0, game code = menu 1, pause menu = menu 2
int health; //declare variable for the block health
Paddle p;  //initialize object from the Paddle class
Ball b;  //initialize object from the Ball class

void setup() {
  //define size of canvas
  size(1100, 700);

  menu = 0; //original menu that pops up is the starting menu with the instructions for the user

  p = new Paddle();
  b = new Ball(width/2, height/2);

  //define arraylists after the size has been defined
  bi = new ArrayList<Block>();
  q = new ArrayList<Pill>();
  li = new ArrayList<Laser>();  

  for (int x = 27; x < width; x+= 55) {
    for (int y = 0; y < 5; y++) {
      bi.add(new Block(x, 10 + y * 20, 5-y));
    }
  }
  heart = loadImage("Heartlife.png");
  health = 3;
}

void draw() {
  background(0);

  if (menu==0) { //starting menu
    background(0);  //background for txt is black
    textAlign(CENTER);  // aligns text
    textSize(30);  //sets size of the "Instructions" text
    text("Instructions", width/2, height/2 - 40);  //display title called "Instructions"
    textSize(20); //sets size of the rest of the text to a smaller size than the title
    text("- Press left and right arrow keys on the keyboard to move the paddle.", width/2, height/2 + 20); //Instruction 2
    text("- To activate a powerup, press the spacebar.", width/2, height/2 + 40); //Instruction 2
    text(" - Press 's' key to play", width/2, height/2 +70);
  }

  if (keyPressed == true && key == 's') { //If s key pressed, exits starting menu and starts game
    menu = 1;
  } else if (menu==1) {
    fill(255); //make fill of the bar white
    rect(0, 4.7*height/5, width, 4.75*height/5); //make bar at the bottom of the screen for health hearts
    imageMode(CENTER); //use the center of the image for the starting point
    if (health == 3) { //if full health, display three hearts
      image(heart, 30, height-20, 30, 30);
      image(heart, 65, height-20, 30, 30);
      image(heart, 100, height-20, 30, 30);
    }
    if (health == 2) { //if loss of 1 health, only display 2 hearts
      image(heart, 30, height-20, 30, 30);
      image(heart, 65, height-20, 30, 30);
    }
    if (health == 1) { // if loss of 2 healths, only display 1 heart
      image(heart, 30, height-20, 30, 30);
    }
    p.move();  //move paddle according to player input
    p.display();  //display paddle
    b.move();  //move ball
    b.display();  //display ball
    b.bounce(); //bounce ball when in contact with walls
    if (b.isInContactWith(p)) {
      b.vel.y *= -1;
      b.vel.x = map(b.loc.x - p.loc.x, 0, 100, -5, 5);
    }
    //if ball touches the bottle of the game window, 1 life is lost
    if (b.loc.y + b.diam/2 >= 4.7*height/5) {
      health -= 1;
    }
    if (health <= 0) {
      menu = 2;
    }
    //create first row of blocks

    for (int i = bi.size() - 1; i >= 0; i--) {
      Block b1 = bi.get(i);
      b1.display();
      if (b.loc.x + b.diam/2 > b1.loc.x && b.loc.x - b.diam/2 < b1.loc.x + b1.wd/2 && b.loc.y + b.diam/2 > b1.loc.y && b.loc.y - b.diam/2 < b1.loc.y + b1.ht/2) {
        if (b1.health == 1) {
          b.vel.y *= -1;
          bi.remove(i);
        } else if (b1.health > 1) {
          
          //reverse the direction of the block
          b.vel.y *= -1;
          
          //subtract 1 health from the block
          b1.health--;
          
          //if the block is purple, change its color to blue
          if (b1.r == 150 && b1.g == 0 && b1.b == 255) {
            b1.r = 0;
            b1.g = 0;
            b1.b = 255;
            
          //if the block is blue, change its color to green
          } else if (b1.r == 0 && b1.g == 0 && b1.b == 255) {
            b1.r = 0;
            b1.g = 255;
            b1.b = 0;
            
          //if the block is green, change its color to yellow
          } else if (b1.r == 0 && b1.g == 255 && b1.b == 0) {
            b1.r = 255;
            b1.g = 255;
            b1.b = 0;
            
          //if the block is yellow, change its color to red
          } else if (b1.r == 255 && b1.g == 255 && b1.b == 0) {
            b1.r = 255;
            b1.g = 0;
            b1.b = 0;
          }
        }
      }
    }
  }


  //if (b.loc.x > b1.loc.x && b.loc.x < b1.loc.x + b1.wd && b.loc.y + b.diam/2 > b1.loc.y){
  // b.vel.y *= -1;
  //}

  //spawn a pill if the hasPowerUp function returns true when a block is hit
  for (int i = q.size() - 1; i >= 0; i--) {
    Pill q1 = q.get(i);
    q1.display();
    q1.move();

    if (q1.isCollectedBy()) {

      float t = random(1, 6); //create variable for type of powerup
      t = round(t);
      PVector ad = new PVector(2, 0); //create new vector to be added to the velocity of the paddle

      //create list of power-ups to be collected by the paddle
      if (t == 1) { //increase the length of the paddle
        p.b = p.b + 10;
      } else if (t == 2) { //decrease the length of the paddle
        p.b = p.b - 10;
      } else if (t == 3) {
        //p.vel.add(ad); //increase the movement speed of the paddle
      } else if (t == 4) {
        //p.vel.sub(ad);
      } else if (t == 5) {
        //LASER!!!
      } else if (t == 6) {
        b.vel.mult(1.1);
      }
    }
  }

  if (keyPressed) {
    if (key == 'l') {
      if (li.size() < 2) {
        Laser l = new Laser(p.loc.x + p.b/2 - 5, height - p.h - 50);
        li.add(l);
      }
    }
  }

  for (int i = li.size() - 1; i >= 0; i--) {
    Laser l = li.get(i);
    l.display();
    l.move();
    if (l.loc.y < 0) {
      li.remove(l);
    }
    for (int j = bi.size() - 1; j >= 0; j--) {
      Block b1 = bi.get(j);
      if (l.isInContactWith(b1)) {
        //println("Laser hit at x = " + l.loc.x + " and block was from range x = " + (b1.loc.x - b1.wd/2) + " to " + (b1.loc.x + b1.wd/2) + ".");
        if (b1.health == 1) {
          li.remove(l);
          bi.remove(b1);
        } else if (b1.health > 1) {
          li.remove(l);
          b1.health--;
          if (b1.r == 150 && b1.g == 0 && b1.b == 255) {
            b1.r = 0;
            b1.g = 0;
            b1.b = 255;
          } else if (b1.r == 0 && b1.g == 0 && b1.b == 255) {
            b1.r = 0;
            b1.g = 255;
            b1.b = 0;
          } else if (b1.r == 0 && b1.g == 255 && b1.b == 0) {
            b1.r = 255;
            b1.g = 255;
            b1.b = 0;
          } else if (b1.r == 255 && b1.g == 255 && b1.b == 0) {
            b1.r = 255;
            b1.g = 0;
            b1.b = 0;
          }
        }
      }
    }
  }


  if (p.loc.x + p.b > width) {
    p.loc.x = width - p.b;
  }
  if (p.loc.x < 0) {
    p.loc.x = 0;
  }

  if (bi.size() == 0) {
    menu = 2;
  }
  if (menu == 2) {
    fill(255);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
  }
}
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//import from library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//import from library
import processing.sound.*;

//create arraylists for each row of block
ArrayList<Block> bi;

//create arraylist for power pills
ArrayList<Pill> q;

//create arraylist for laser
ArrayList<Laser> li;

int lz; //declare variable for determining if player has access to the laser
PImage heart; //declare variable for the hearts
PImage colorful; //declare variable for background
int menu;   //starting menu =  menu 0, game code = menu 1, pause menu = menu 2
int health; //declare variable for the block health
int score = 0; //declare variable for score, initial score = 0
Paddle p;  //initialize object from the Paddle class
Ball b;  //initialize object from the Ball class
Minim minim;
AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;

void setup() {
  //define size of canvas
  size(1100, 700);

  lz = 0; //initialize lz as 0
  menu = 0; //original menu that pops up is the starting menu with the instructions for the user
  minim = new Minim(this);
  player = minim.loadFile("bensound-funkyelement.mp3");
  player2 =  minim.loadFile("Pac-Man intro music.mp3");
  player3 = minim.loadFile("Sad Violin.mp3");
  player4 = minim.loadFile("Nintendo Wii - Mii Channel - Plaza Music (Extended) HD.mp3");
  p = new Paddle();
  b = new Ball(width/2, height/2);

  imageMode(CENTER);                                                    //center image placement
  colorful = loadImage("colorful.jpg");                                 //load image of colorful explosion

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

  if (menu==0) {
    background(0);  //background for txt is black
    image(colorful, width/2, height/2, colorful.width, colorful.height);         //loads background image
    textAlign(CENTER);  // aligns text
    textSize(50);
    fill(50);
    text("BREAKOUT", width/2, height/2);
    textSize(25);
    text(" - Press 'i' to view instructions", width/2, height/2 +100);
    text(" - Press ENTER to play", width/2, height/2 +70);
    player2.play();
    if (keyPressed == true && key == ENTER) { //If enter key pressed, exits starting menu and starts game
      menu = 2;
      player2.pause();
    }
    if (keyPressed == true && key == 'i') { //If i key pressed, exits starting menu and starts game
      menu = 1;
      player2.pause();
    }
  }

  if (menu==1) { //starting menu
    background(0);  //background for txt is black
    image(colorful, width/2, height/2, colorful.width, colorful.height);         //loads background image
    textAlign(CENTER);  // aligns text
    textSize(30);  //sets size of the "Instructions" text
    text("Instructions", width/2, height/2 - 80);  //display title called "Instructions"
    textSize(20); //sets size of the rest of the text to a smaller size than the title

    text("- Press left and right arrow keys on the keyboard to move the paddle.", width/2, height/2 ); //Instruction 2
    text("- To activate a powerup, press the spacebar.", width/2, height/2 + 20); //Instruction 2
    //list power-ups available
    text("POWER UPS:", width/2, height/2 + 70);
    text("Lengthened Paddle: Green", width/2, height/2 + 90);
    text("Shortened Paddle: Yellow", width/2, height/2 + 110);
    text("Increased Paddle Movement: Red", width/2, height/2 + 130);
    text("Decreased Paddle Speed: Blue", width/2, height/2 + 150);
    text("Laser (3 shots per pickup); Orange. Press 'L' to fire", width/2, height/2 + 170);
    text("Increased projectile speed: Red (increases w/ each pickup)", width/2, height/2 + 190);
    player.play();
    player2.pause();
    textSize(50);
    text("Press ENTER key to play", width/2, height - 90);
  }

  if (keyPressed == true && key == ENTER ) { //If ENTER key pressed, exits starting menu and starts game
    menu = 2;
  } else if (menu==2) {
    fill(255); //make fill of the bar white
    rect(0, 4.7*height/5, width, 4.75*height/5); //make bar at the bottom of the screen for health hearts
    player.pause();
    player4.play();
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
      score += 10;
    }

    //if ball touches the bottle of the game window, 1 life is lost
    if (b.loc.y + b.diam/2 >= 4.7*height/5) {
      health -= 1;
    }
    if (health <= 0) {
      menu = 3;
    }

    for (int i = bi.size() - 1; i >= 0; i--) { //create a number of blocks of the given size

      //name each individual block "b1"
      Block b1 = bi.get(i);

      //display each individual block
      b1.display();

      //if the ball intersects a block
      if (b.loc.x + b.diam/2 > b1.loc.x && b.loc.x - b.diam/2 < b1.loc.x + b1.wd/2 && b.loc.y + b.diam/2 > b1.loc.y && b.loc.y - b.diam/2 < b1.loc.y + b1.ht/2) {

        if (b1.hasPowerUp()) {
          q.add(new Pill(b1.loc.x, b1.loc.y));
        }

        //if health is equal to one at the time of contact
        if (b1.health == 1) {

          //reverse the velocity of the ball and remove the block from the arraylist
          b.vel.y *= -1;
          bi.remove(i);

          //if health is more than one at the time of contact
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
      if (t == 1) { //increase the length of the paddle and color it green
        p.r = 100;
        p.g = 255;
        p.bl = 100;
        if (p.b < 160) { //only increase the size if the paddle isn't too big
          p.b = p.b + 10;
        }
      } else if (t == 2) { //decrease the length of the paddle and color it yellow
        p.r = 255;
        p.g = 255;
        p.bl = 50;
        if (p.b > 40) {
          p.b = p.b - 10; //only decrease the size if the paddle isn't too small
        }
      } else if (t == 3) { //increase the movement speed of the paddle and color it red
        p.r = 255;
        p.g = 50;
        p.bl = 50;
        p.mov.add(ad); //increase the movement speed of the paddle
      } else if (t == 4) { //decrease the movement speed of the paddle and color it blue
        p.mov.sub(ad); //decrease the movement speed of the paddle
        p.r = 50;
        p.g = 50;
        p.bl = 255;
      } else if (t == 5) {
        lz = 3; //give the player three shots of the laser and color it 
        p.r = 255;
        p.g = 165;
        p.bl = 10;
      } else if (t == 6) {
        b.vel.mult(1.1); //increase the movement speed of the ball and increase its redness
        b.g = b.g - 10;
        b.bl = b.bl - 10;
      }
      q.remove(i); //remove the pill from the arrayList
    }
  }

  if (lz > 0) {
    if (keyPressed) {
      if (key == 'l') {
        if (li.size() < 2) {
          lz = lz - 1; //subtract 1 from the laser ammo
          Laser l = new Laser(p.loc.x + p.b/2 - 5, height - p.h - 50);
          li.add(l);
        }
      }
    }

    for (int i = li.size() - 1; i >= 0; i--) {

      //create a new laser
      Laser l = li.get(i);
      //display the laser
      l.display();
      //move the laser
      l.move();

      //if the laser hits the top of the screen, remove the laser
      if (l.loc.y < 0) {
        li.remove(l);
      }

      //for the array of blocks
      for (int j = bi.size() - 1; j >= 0; j--) {
        Block b1 = bi.get(j);

        //if the laser is in contact with a block
        if (l.isInContactWith(b1)) {

          //if the block has one health at the time of contact, remove both block and laser
          if (b1.health == 1) {
            li.remove(l);
            bi.remove(b1);

            //if the block has more than one health at the time of contact, remove the laser and decrease the block's health by 1
          } else if (b1.health > 1) {
            li.remove(l);
            b1.health--;

            //if the color of the block is purple at the time of contact, make the block's color blue
            if (b1.r == 150 && b1.g == 0 && b1.b == 255) {
              b1.r = 0;
              b1.g = 0;
              b1.b = 255;

              //if the color of the block is blue at the time of contact, make the block's color green
            } else if (b1.r == 0 && b1.g == 0 && b1.b == 255) {
              b1.r = 0;
              b1.g = 255;
              b1.b = 0;

              //if the color of the block is green at the time of contact, make the block's color yellow
            } else if (b1.r == 0 && b1.g == 255 && b1.b == 0) {
              b1.r = 255;
              b1.g = 255;
              b1.b = 0;

              //if the color of the block is yellow at the time of contact, make the block's color red
            } else if (b1.r == 255 && b1.g == 255 && b1.b == 0) {
              b1.r = 255;
              b1.g = 0;
              b1.b = 0;
            }
          }
        }
      }
    }
  }

  //if the paddle begins to go beyond the edge of the canvas, reset its location
  if (p.loc.x + p.b > width) {
    p.loc.x = width - p.b; //prevent paddle from moving beyond right edge of the canvas
  }
  if (p.loc.x < 0) { 
    p.loc.x = 0; //prevent paddle from moving beyond left edge of the canvas
  }

  if (bi.size() <= 0) {
    menu = 4;
  }
  if (menu == 3) {
    background(255);
    textAlign(CENTER);  // aligns text
    textSize(80);
    fill(50);
    image(colorful, width/2, height/2, colorful.width, colorful.height);         //loads background image
    textAlign(CENTER);
    text("GAME OVER!!!", width/2, height/2);
    text("You Lose!", width/2, height/2 + 70);
    text("Your Score Is:" + score, width/2, height/2 + 140);
    player3.play();
    player.pause();
    player4.pause();
  }
  if (menu == 4) {
    background(255);
    image(colorful, width/2, height/2, colorful.width, colorful.height);         //loads background image
    textSize(80);
    fill(50);
    textAlign(CENTER);
    text("GAME OVER!", width/2, height/2);
    text("You Win!", width/2, height/2 + 70);
    text("Your Score Is:" + score, width/2, height/2 + 140);
  }
}
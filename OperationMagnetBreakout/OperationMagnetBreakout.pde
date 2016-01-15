float menu;   //starting menu =  menu 0, game code = menu 1, pause menu = menu 2, powerup menu = menu 3

void setup() {
  size(1200, 800); //sets size of canvas
  background(0); //sets starting background to black
  menu = 0; //original menu that pops up is the starting menu with the instructions for the user
}

void draw() {
  if (menu==0) { //starting menu
    background(0);  //background for txt is black
    textAlign(CENTER);  // aligns text
    textSize(30);  //sets size of the "Instructions" text
    text("Instructions", width/2, height/2 - 40);  //display title called "Instructions"
    textSize(20); //sets size of the rest of the text to a smaller size than the title
    text("- Press any key to start the ball moving.", width/2, height/2); //Instruction 1
    text("- Press left and right arrow keys on the keyboard to move the paddle.", width/2, height/2 + 20); //Instruction 2
    text("- To activate a powerup, press the spacebar.", width/2, height/2 + 40); //Instruction 2
    text(" - Press 's' key to play", width/2, height/2 +70);
    text(" - Press 'p' key to pause", width/2, height/2 +100);
    text(" - Press 'u' key to see powerups (only works on start menu and pause screen)", width/2, height/2+130);
    if (keyPressed == true) { //If s key pressed, exits starting menu and starts game
      if (key == 's') {
        menu = 1;
      }
    } 
    if (menu==1) {
      if (keyPressed == true) {
        if (key == 'p') {
          menu = 2;
        }
      }
    }
    if (menu==2) {
      background(0);
      fill(255);
      textSize(30);  //sets size of the "Instructions" text
      text("Instructions", width/2, height/2 - 40);  //display title called "Instructions"
      textSize(20); //sets size of the rest of the text to a smaller size than the title
      text("- Press any key to start the ball moving", width/2, height/2); //Instruction 1
      text("- Press left and right arrow keys on the keyboard to move the paddle", width/2, height/2 + 20); //Instruction 2
      text("- To activate a powerup, press the spacebar.", width/2, height/2 + 40); //Instruction 2
      text(" - Press 's' key to play", width/2, height/2 +70);
      text(" - Press 'u' key to see powerups (only works on start menu and pause screen)", width/2, height/2 +100);
      fill(255, 50, 0);
      textSize(50);
      textAlign(CENTER);
      text("PAUSED", width/2, 50);
    }
    if (menu==3) {
    }
  }
}
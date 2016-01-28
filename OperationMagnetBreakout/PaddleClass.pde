class Paddle {
  PVector loc; //declare variable for the location pvector
  PVector mov; //declare variable for the movement of the paddle
  int b; //declare an integer for the length of the base of the paddle
  int h; //declare an integer for the height of the paddle
  int r; //declare an integer for the red color of the paddle
  int g; //declare an integer for the green color of the paddle
  int bl; //declare an integer for the blue color of the paddle

  //create the paddle format itself
  Paddle() {
    //define the location vector for the 
    loc = new PVector(width/2, 4.7*height/5-h);
    
    //define the vector for the movement of the paddle
    mov = new PVector(6,0);
    
    //define length of base and height of the paddle
    b = 100;
    h = 20;
    
    //define the starting color of the paddle as white
    r = 255;
    g = 255;
    bl = 255;
  }

  void display() {
    fill(r,g,bl); //color of paddle is white
    rect(loc.x, loc.y, b, -h); //paddle is a rectangle
  }

  void move() { //how to move the paddle
    if (keyPressed) { //if the rigth arrow key is pressed, paddle moves right
      if (key == CODED) {
        if (keyCode == RIGHT) {
          loc.add(mov);
        }
        if (keyCode == LEFT) { //if the left arrow key is pressed, paddle moves left
          loc.sub(mov);
        }
      }
    }
  }
}
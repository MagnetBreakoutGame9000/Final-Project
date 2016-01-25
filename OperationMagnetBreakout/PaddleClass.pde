class Paddle {
  PVector loc; //declare variable for the location pvector
  int b; //declare an integer for the length of the base of the paddle
  int h; //declare an integer for the height of the paddle

  Paddle() {
    loc = new PVector(width/2, 4.7*height/5-h);
    b = 100;
    h = 20;
  }

  void display() {
    fill(255); //color of paddle is white
    rect(loc.x, loc.y, b, -h); //paddle is a rectangle
  }

  void move() { //how to move the paddle
    if (keyPressed) { //if the rigth arrow key is pressed, paddle moves right
      if (key == CODED) {
        if (keyCode == RIGHT) {
          loc.x += 5;
        }
        if (keyCode == LEFT) { //if the left arrow key is pressed, paddle moves left
          loc.x -= 5;
        }
      }
    }
  }
}
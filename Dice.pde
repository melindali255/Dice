int total = 0;
boolean rolled = false;
int numRolled = 1;
int opacity = 255;
void setup()
{
  background(119, 161, 227);
  size(300, 300);
  textAlign(CENTER);
  noLoop();
}
void draw()
{
  //background(119, 161, 227);
  //make 2 rows of 3 die
  for (int y = 0; y < 2*75; y+=75) {
    for (int x = 0; x < 3*75; x+=75) {
      Die square = new Die (x + 40, y + 20);
      if (rolled == false && numRolled <= 6) {
        square.roll();
        numRolled += 1;
      }
      square.checkForClick();
      square.show();
      total += square.number;
    }
  }

  //box to layer over totals
  noStroke();
  fill(119, 161, 227);
  rect(100, 175, 100, 50);
  //total text
  fill(0);
  stroke(0);
  text("Total: " + total, 150, 200);
}
void mousePressed()
{
  total = 0;
  redraw();
}
class Die //models one single dice cube
{
  int myX;
  int myY;
  int number;
  int sideLength;
  
  Die(int x, int y)
  {
    myX = x;
    myY = y;
    sideLength = 65;
  }
  void roll() //add to show?
  {
    number = (int)(Math.random()*6 + 1);
  }
  void checkForClick() {
    if (mouseX >= myX && mouseX <= myX + sideLength && mouseY >= myY && mouseY <= myY + sideLength && mousePressed == true) {
      roll();
      opacity = 255;
    }
    else if (numRolled > 6)
    {
      opacity = 0;
    }
  }
  void show()
  {
    //show the die
    fill(255, 255, 255, opacity);
    noStroke();
    rect(myX, myY, sideLength, sideLength, 12, 12, 12, 12);
    //die face -- change to switch?
    fill(0);
    //show appropiate number of dots
    if (number == 1) {
      ellipse(myX + 65/2, myY + 65/2, 12, 12); //center
    } else if (number == 2) {
      ellipse(myX + 15, myY + 15, 12, 12); //top left
      ellipse(myX + 50, myY + 50, 12, 12); //top right
    } else if (number == 3) {
      ellipse(myX + 15, myY + 15, 12, 12); //top left
      ellipse(myX + 65/2, myY + 65/2, 12, 12); //center
      ellipse(myX + 50, myY + 50, 12, 12); //bottom right
    } else if (number == 4) {
      ellipse(myX + 15, myY + 15, 12, 12); //top left
      ellipse(myX + 50, myY + 15, 12, 12); //top right
      ellipse(myX + 15, myY + 50, 12, 12); //bottom left
      ellipse(myX + 50, myY + 50, 12, 12); //bottom right
    } else if (number == 5) {
      ellipse(myX + 15, myY + 15, 12, 12); //top left
      ellipse(myX + 50, myY + 15, 12, 12); //top right 
      ellipse(myX + 65/2, myY + 65/2, 12, 12); //center
      ellipse(myX + 15, myY + 50, 12, 12); //bottom left
      ellipse(myX + 50, myY + 50, 12, 12); //bottom right
    } else if (number == 6) {
      ellipse(myX + 15, myY + 15, 12, 12); //top left
      ellipse(myX + 50, myY + 15, 12, 12); //top right
      ellipse(myX + 15, myY + 65/2, 12, 12); //center left
      ellipse(myX + 50, myY + 65/2, 12, 12); //center right
      ellipse(myX + 15, myY + 50, 12, 12); //bottom left
      ellipse(myX + 50, myY + 50, 12, 12); //bottom right
    }
  }
}

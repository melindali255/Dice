Die first = new Die(20, 20);
void setup()
{
  background(0);
  size(300, 300);
  noLoop();
}
void draw()
{
  background(0);
  first = new Die (50, 50);
  first.roll();
  first.show();
}
void mousePressed()
{
  redraw();
}
class Die //models one single dice cube
{
  int myX;
  int myY;
  int number;
  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
  }
  void roll()
  {
    double numroll = Math.random()*6 + 1;
    if (numroll < 10) {
      number = 1;
    }
  }
  void show()
  {
    rect(myX, myY, 65, 65, 18, 18, 18, 18);
    if (number == 1) {
      fill(0);
      ellipse(myX/2, myY/2, 20, 20);
    }
  }
}

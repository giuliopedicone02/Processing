class Casa
{
  int posX, posY, velX;

  Casa(int posX, int posY, int velX)
  {
    this.posX=posX;
    this.posY=posY;
    this.velX=velX;
  }

  void display()
  {
    strokeWeight(2);
    stroke(255,255,0);
    noFill();
    triangle(posX,posY,posX+30,posY,posX+15,posY-15); //Tetto
    rect(posX,posY,30,30); //Casa
  }

  void move()
  {
    posX+=velX;
  }

  void bounce()
  {
    if(posX+30>=width||posX<=0)
    {
      velX=-velX;
    }
  }

  void run()
  {
    move();
    bounce();
    display();
  }
}

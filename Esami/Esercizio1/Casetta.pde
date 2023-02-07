class Casetta extends Casa
{
  Casetta(int posX, int posY, int velX)
  {
    super(posX, posY, velX);
    this.velX=-velX;
  }

  void display()
  {
    stroke(255);
    strokeWeight(2);
    noFill();
    triangle(posX, posY, posX+30, posY, posX+15, posY-15); //Tetto
    rect(posX, posY, 30, 30); //Casa
    fill(255);
    rect(posX+10, posY+15, 10, 15); //Porta
  }


  void move()
  {
    posX+=velX;
  }

  void bounce()
  {
    if (posX<=0)
    {
      posX=width;
    }
  }

  void run()
  {
    move();
    bounce();
    display();
  }
}

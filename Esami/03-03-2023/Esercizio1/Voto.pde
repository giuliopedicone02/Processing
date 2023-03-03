class Voto
{
  int posX, posY, velX;
  int voto = int(random(18,31));

  Voto(int posX, int posY, int velX)
  {
    this.posX=posX;
    this.posY=posY;
    this.velX=velX;
  }

  void display()
  {
    strokeWeight(2);
    fill(0);
    stroke(255,255,0);
    rect(posX,posY,30,30);
    noFill();
    textSize(28);
    fill(255);
    text(voto,posX+2,posY+25);
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

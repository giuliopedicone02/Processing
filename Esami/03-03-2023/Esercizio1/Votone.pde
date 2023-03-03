class Votone extends Voto
{
  Votone(int posX, int posY, int velX)
  {
    super(posX, posY, velX);
    this.velX=0;
  }

  void display()
  {
    strokeWeight(2);
    fill(0);
    stroke(255);
    rect(posX, posY, 30, 30);
    noFill();
    textSize(28);
    fill(255);
    text(voto, posX+2, posY+25);
    if (voto>24)
    {
      fill(255);
      text("LODE", posX, posY+55);
    }
  }
}

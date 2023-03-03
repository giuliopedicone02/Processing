ArrayList<Voto> array_voti;
ArrayList<Votone> array_votoni;

void setup()
{
  size(500, 500);
  
  array_voti = new ArrayList<Voto>();
  array_votoni = new ArrayList<Votone>();
}

void draw()
{
  background(0);

  for (Voto v : array_voti)
    v.run();

  for (Votone vo : array_votoni)
    vo.run();
}

void mousePressed()
{
  if (mouseButton==LEFT)
  {
    array_voti.add(new Voto(int(random(30,width-30)), int(random(30,height-30)), int(random(2, 10))));
  }
  if (mouseButton==RIGHT)
  {
    array_votoni.add(new Votone(int(random(30,width-30)), int(random(30,height-30)), int(random(2, 10))));
  }
}

void keyPressed()
{
  if (key=='r'||key=='R')
  {
    setup();
  }
}

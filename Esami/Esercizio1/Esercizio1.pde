ArrayList<Casa> array_case;
ArrayList<Casetta> array_casette;

void setup()
{
  size(500, 500);
  
  array_case = new ArrayList<Casa>();
  array_casette = new ArrayList<Casetta>();
}

void draw()
{
  background(0);

  for (Casa c : array_case)
    c.run();

  for (Casetta ca : array_casette)
    ca.run();
}

void mousePressed()
{
  if (mouseButton==LEFT)
  {
    array_case.add(new Casa(int(random(50, 450)), int(random(50, 450)), int(random(2, 10))));
  }
  if (mouseButton==RIGHT)
  {
    array_casette.add(new Casetta(int(random(50, 450)), int(random(50, 450)), int(random(2, 10))));
  }
}

void keyPressed()
{
  if (key=='r'||key=='R')
  {
    setup();
  }
}

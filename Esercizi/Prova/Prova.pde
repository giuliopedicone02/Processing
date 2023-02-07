PImage Im, ImInv;

void setup()
{
  size(1024, 512);
  Im=loadImage("lena.png");
  Im.filter(GRAY);
  image(Im, 0, 0);

  ImInv=inv(Im);
  image(ImInv, 512, 0);
}

void draw()
{
}


PImage inv(PImage I)
{
  PImage res=I.copy();
  PImage sup;
  PImage inf;

  sup=res.get(0, 0, res.width, res.height/2); //Ritaglia un rettangolo di dimensioni [width,height/2] a partire dal punto (0,0)
  inf=res.get(0, res.width/2, res.width, res.height/2); //Ritaglia un rettangolo di dimensioni [width,height/2] a partire dal punto (0,res.width/2)

  res.set(0, 0, inf);
  res.set(0, res.width/2, sup);

  res.loadPixels();

  color c=color(255, 255, 0);
  for (int i=0; i<res.width; i++)
  {
    res.pixels[pos(i, i, res.width)]=c;
  }
  
  res.updatePixels();

  return res;
}

int pos (int x, int y, int w) 
{
  return x+y*w;
}

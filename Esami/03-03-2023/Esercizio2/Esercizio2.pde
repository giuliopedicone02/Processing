PImage Im, ImMod;

void setup()
{
  size(512, 512);
  Im=loadImage("lena.png");
  ImMod=wow(Im);
  image(ImMod, 0, 0);
}

void draw()
{
}

PImage wow(PImage I)
{
  PImage res, primo, secondo, terzo;
  float f = random(0,3);
  
  res=I.copy();

  primo=res.get(0, 0, res.width/3, res.height); //Primo terzo
  secondo=res.get(res.width/3, 0, res.width/3, res.height); //Secondo terzo
  terzo=res.get(2*(res.width)/3, 0, res.width/3, res.height); //Terzo terzo

  float red, green, blue;
  
  for (int i=0; i<primo.pixels.length; i++)
  {
    red = red(primo.pixels[i])/f;
    green = green(primo.pixels[i]);
    blue = blue(primo.pixels[i]);

    primo.pixels[i] = color(red, green, blue); 
  }
  
  for (int i=0; i<terzo.pixels.length; i++)
  {
    red = red(terzo.pixels[i])*f;
    green = green(terzo.pixels[i]);
    blue = blue(terzo.pixels[i]);

    terzo.pixels[i] = color(red, green, blue); 
  }

  res.set(0, 0, terzo);
  res.set(res.width/3, 0, secondo);
  res.set(2*(res.width)/3, 0, primo);

  return res;
}

void keyPressed()
{
  if (key=='R'||key=='r')
  {
    setup();
  }
}

PImage Im, ImMod;

void setup()
{
  size(512, 256);
  Im=loadImage("lena.png");
  Im.resize(256, 256);
  image(Im, 0, 0);

  ImMod=wow(Im);
  image(ImMod, 256, 0);
}

void draw()
{
}

PImage wow(PImage I)
{
  PImage res, sx, dx;
  res=I.copy();

  sx=res.get(0, 0, res.width/2, res.height); //Metà sinistra
  dx=res.get(res.width/2, 0, res.width/2, res.height); //Metà destra
  
  //Inverto le due metà delle immagini
  
  res.set(0, 0, dx); 
  res.set(res.width/2, 0, sx);

  res.loadPixels();

  float red, green, blue;
  float window = res.pixels.length * random(1, 100)/100;

  for (int i=0; i<window; i++) //inverto il window% di pixel rossi e blu
  {
    red = red(res.pixels[i]);
    green = green(res.pixels[i]);
    blue = blue(res.pixels[i]);

    res.pixels[i] = color(blue, green, red);
  }

  for (int i=(int)window; i<res.pixels.length; i++) //Inverto i restanti pixel verdi e blu
  {
    red = red(res.pixels[i]);
    green = green(res.pixels[i]);
    blue = blue(res.pixels[i]);

    res.pixels[i] = color(red, blue, green);
  }


  res.updatePixels();

  return res;
}

void keyPressed()
{
  if (key=='R'||key=='r')
  {
    setup();
  }
}

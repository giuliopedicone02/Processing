/*
*  Quantizzazione L'=(L*K)/N
 */

PImage Im, Iq;
int k=2; //Cambiare questo valore per modificare il numero di livelli che si vogliono visualizzare

void setup()
{
  Im=loadImage("lena.png");
  Im.filter(GRAY);
  size(1024, 512);
  image(Im, 0, 0);

  Iq=quant(Im, k);
  image(Iq, 512, 0);
}

void draw()
{
}

PImage quant(PImage I, int kk)
{
  PImage R=I.copy();
  R.loadPixels();

  int q;

  //Un ciclo for se non ci interessa la posizione del pixel (operatori puntuali), altrimenti due cicli for (operatori locali)

  for (int i=0; i<R.pixels.length; i++)
  {
    q=floor(red(R.pixels[i]*kk/256));
    q=int(float(q)/(kk-1)*255);

    //q=int(lerp(0,255,float(q)/(kk-1)))

    R.pixels[i]=color(q);
  }

R.updatePixels();
  return R;
}

void keyPressed()
{
  if (key=='+' && k<256)
  {
    k++;
  }

  if (key=='-' && k>2)
  {
    k--;
  }

  if (key=='r' || key=='R')
  {
    setup();
  }
}

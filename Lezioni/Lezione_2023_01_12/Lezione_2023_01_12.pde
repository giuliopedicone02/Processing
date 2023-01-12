/*
*  Quantizzazione L'=(L*K)/N
 */

/*

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
 
 */

/*
*  MSE e PSNR
 */

PImage Im, Ic, Ir;
float mseO, mseP, mseR, psnrO, psnrP, psnrR;

void setup()
{
  Im=loadImage("lena.png");
  Im.filter(GRAY);
  size(1536, 512);
  background(0);

  Ic=Im.copy();
  Ic.resize(256, 256);
  Ic.resize(512, 512);

  Ir=Im.copy();
  Ir=replication2x(Ir);
}

void draw()
{
}

PImage replication2x(PImage I)
{
  PImage R=createImage(I.width*2, I.height*2, RGB);

  for (int x=0; x<I.width; x++)
  {
    for (int y=0; y<I.height; y++)
    {
      R.set(2*x,2*y,I.get(x,y));
      R.set(2*x+1,2*y,I.get(x,y));
      R.set(2*x,2*y+1,I.get(x,y));
      R.set(2*x+1,2*y+1,I.get(x,y));
    }
  }
  
  return R;
}

float MSE(PImage I1, PImage I2)
{
  float res=0;
  I1.loadPixels();
  I2.loadPixels();

  for (int i=0; i<I1.pixels.length; i++)
  {
    res+=pow(blue(I1.pixels[i])-blue(I2.pixels[i]), 2);
  }

  return res/I1.pixels.length;
}

float PSNR(PImage I1, PImage I2)
{
  float res=0;

  float mse= MSE(I1, I2);

  res=10*log(255*255/mse)/log(10);

  return res;
}

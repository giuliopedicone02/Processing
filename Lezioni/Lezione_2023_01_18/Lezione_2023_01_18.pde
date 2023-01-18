/*
* CONVOLUZIONE (Laplaciano, N-Box, SobelX, Sharpening)
 */

/*

 PImage Im, In3, In5, Il, Is, IsX;
 
 float n3=1/9.0;
 float[][] nbox3={{n3, n3, n3},
 {n3, n3, n3},
 {n3, n3, n3}};
 
 float n5=1.0/25;
 float[][] nbox5={{n5, n5, n5, n5, n5},
 {n5, n5, n5, n5, n5},
 {n5, n5, n5, n5, n5},
 {n5, n5, n5, n5, n5},
 {n5, n5, n5, n5, n5}};
 
 float[][] lapl={ {-1, 0, -1}, {0, 4, 0}, {-1, 0, -1}};
 
 float[][] sobX={ {-1, -2, -1}, {0, 0, 0}, {1, 2, 1}};
 
 float[][] sharp={{-1, 0, -1}, {0, 5, 0}, {-1, 0, -1}};
 
 float[][] random={{2, -2, -3}, {5, -1, 0.5}, {-1, 4, 2}};
 
 void setup()
 {
 size(1024, 1024);
 Im=loadImage("lena.png");
 Im.filter(GRAY);
 
 //Applico i kernel
 In3=converti(convoluzione(Im, nbox3));
 In5=converti(convoluzione(Im, nbox5));
 Il=converti(convoluzione(Im, lapl));
 Is=converti(convoluzione(Im, sharp));
 IsX=converti(convoluzione(Im, sobX));
 
 image(Im, 0, 0);
 image(In5, 512, 0);
 image(Il, 0, 512);
 image(Is, 512, 512);
 }
 
 //Attenzione: get(x,y) = M[y][x]
 
 void draw()
 {
 }
 
 float[][] convoluzione(PImage I, float [][] kernel)
 {
 float[][]result=new float[I.height][I.width]; //Numero di righe (altezza) e poi il numero di colonne (larghezza)
 
 int M=kernel.length; //Quante righe ci sono nel kernel
 int N=kernel[0].length; //Quante colonne ci sono nel kernel
 
 PImage tmp; //Immagine di dimensione N x M da utilizzare per applicare la convoluzione
 float res;
 
 for (int x=0; x<I.width; x++)
 {
 for (int y=0; y<I.height; y++)
 {
 tmp=I.get(y-M/2, x-N/2, M, N);
 res=0;
 
 for (int p=0; p<N; p++)
 {
 for (int q=0; q<M; q++)
 {
 res+=red(tmp.get(p, q))*kernel[q][p];
 }
 }
 
 result[y][x]=res;
 }
 }
 return result;
 }
 
 PImage converti(float[][] im) //Serve a convertire la matrice in un'immagine
 {
 PImage result=createImage(im[0].length, im.length, RGB);
 float res=0;
 for (int x=0; x<result.width; x++)
 {
 for (int y=0; y<result.height; y++)
 {
 res=constrain(im[x][y], 0, 255);
 result.set(x, y, color(res));
 }
 }
 return result;
 }
 
 */

/*
* RANGO, MEDIANO, MINIMO, MASSIMO
 */

/*

 PImage Im, Imax, Imin, Imed;
 
 void setup()
 {
 size(1024, 1024);
 Im=loadImage("lena.png");
 Im.filter(GRAY);
 
 Imax=massimo(Im, 11);
 Imin=minimo(Im, 11);
 Imed=mediano(Im, 11);
 
 image(Im, 0, 0);
 image(Imin, 512, 0);
 image(Imax, 0, 512);
 image(Imed, 512, 512);
 }
 
 void draw()
 {
 }
 
 PImage minimo(PImage I, int N)
 {
 PImage R=createImage(I.width, I.height, RGB);
 PImage tmp;
 int off=N/2;
 float[] tmpF;
 int xs;
 int ys;
 
 for (int x=0; x<I.width; x++)
 {
 for (int y=0; y<I.height; y++)
 {
 xs=x-off;
 ys=y-off;
 
 tmp=I.get(max(0, xs), max(0, ys), min(N, min(N+xs, I.width-xs)), min(N, min(N+ys, I.height-ys)));
 
 tmp.loadPixels();
 
 tmpF=new float[tmp.pixels.length];
 
 for (int i=0; i<tmp.pixels.length; i++)
 {
 tmpF[i]=green(tmp.pixels[i]);
 }
 
 R.set(x, y, color(min(tmpF))); //Trovo il minimo
 }
 }
 
 return R;
 }
 
 PImage massimo(PImage I, int N)
 {
 PImage result=createImage(I.width, I.height, RGB);
 PImage tmp;
 int off=N/2;
 float[] tmpF = new float[N*N];
 
 for (int y=0; y<I.height; y++)
 {
 for (int x=0; x<I.width; x++)
 {
 tmp=I.get(x-off, y-off, N, N);
 tmp.loadPixels();
 
 for (int i=0; i<tmp.pixels.length; i++)
 {
 tmpF[i]=red(tmp.pixels[i]);
 }
 
 result.set(x, y, color(max(tmpF))); //trovo il massimo
 }
 }
 
 return result;
 }
 
 PImage mediano(PImage I, int N)
 {
 PImage result=createImage(I.width, I.height, RGB);
 PImage tmp;
 int off=N/2;
 float[] tmpF;
 float med;
 tmpF=new float[N*N];
 
 for (int x=0; x<I.width; x++)
 {
 for (int y=0; y<I.height; y++)
 {
 
 tmp=I.get(x-off, y-off, N, N);
 
 tmp.loadPixels();
 
 for (int i=0; i<tmp.pixels.length; i++)
 {
 tmpF[i]=green(tmp.pixels[i]);
 }
 
 tmpF=sort(tmpF); //ordina l'array per effettuare l'operazione mediano
 
 if ((N*N)%2==1) //Se la lunghezza dell'array è dispari...
 med=tmpF[(N*N)/2];
 else //Altrimenti...
 {
 med=(tmpF[(N*N)/2]+tmpF[(N*N)/2-1])/2;
 }
 
 result.set(x, y, color(med));
 }
 }
 
 return result;
 }
 
 */

/*
* BIT PLANES
 */

PImage Im, Ib;
int K;

void setup()
{
  Im=loadImage("lena.png");
  Im.filter(GRAY);
  size(1024, 512);
  image(Im, 0, 0);

  K=7;
  Ib=bitplane(Im, K);
  image(Ib, 512, 0);
}

void draw()
{
}

PImage bitplane(PImage I, int nb)
{
  PImage result=I.copy();

  result.loadPixels();

  int x;
  int r;

  for (int i=0; i<result.pixels.length; i++)
  {
    x=int(blue(result.pixels[i]));

    r=(x>>nb)&1;

    result.pixels[i]=color(255*r);
  }

  result.updatePixels();
  return result;
}

void keyPressed()
{
  println("Bitplane #"+K);

  if ((key=='+')&&(K<7))
  {
    Ib=bitplane(Im, ++K);
    image(Ib, 512, 0);
  }
  if ((key=='-')&&(K>0))
  {
    Ib=bitplane(Im, --K);
    image(Ib, 512, 0);
  }

  if (key=='r'||key=='R')
  {
    setup();
  }
}

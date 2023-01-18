/*
* CONVOLUZIONE (Laplaciano, N-Box, SobelX, Sharpening)
 */

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

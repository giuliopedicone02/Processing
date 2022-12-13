/*
*  INTRODUZIONE ALLE IMMAGINI IN PROCESSING
 */

/*

 PImage im;
 
 void setup()
 {
 size(600, 600);
 im=loadImage("lena.png");
 
 println("Lunghezza: "+im.width);
 println("Altezza: "+im.height);
 }
 
 void draw()
 {
 background(0);
 image(im, 0, 0);
 }
 
 void mousePressed()
 {
 im.resize(im.width/2, im.height/2);
 }
 
 void mouseReleased()
 {
 im.resize(512, 512); // Viene utilizzato l'algoritmo di interpolazione replication, l'immagine perde quialità
 }
 
 void keyTyped()
 {
 if (key=='s')
 {
 im.save(savePath("lenaPiccola.png"));
 }
 
 if(key=='c')
 {
 saveFrame("ciccio##.png");
 }
 }
 
 */

/*
*  FILTRI SULLE IMMAGINI
 */

/*
PImage I;
 int b=0;
 String url="https://upload.wikimedia.org/wikipedia/en/7/7d/Lenna_%28test_image%29.png";
 
 void settings()
 {
 I=loadImage(url);
 size(I.width, I.height);
 }
 
 void draw()
 {
 image(I, 0, 0, I.width, I.height);
 }
 
 void keyTyped()
 {
 if (key=='+')
 {
 b++;
 I.filter(BLUR, b);
 println("Blur: "+b);
 }
 
 if (key=='r')
 {
 b=0;
 I=loadImage(url);
 }
 }
 */

/*
*  COLOR PICKER
 */

/*
PImage I;
 color c;
 int x, y;
 
 void setup()
 {
 size(500, 500);
 I=loadImage("lena.png");
 I.resize(200, 200);
 c=color(0);
 x=width/2-I.width/2;
 y=height/2-I.height/2;
 }
 
 void draw()
 {
 background(c);
 c=I.get(mouseX-x, mouseY-y);
 image(I,x,y);
 println("R: "+red(c)+", G: "+green(c)+", B: "+blue(c));
 }
 */

/*
* OPERAZIONI PUNTUALI
 */

/*
PImage I;
 color c, c1;
 int ar;
 
 void setup()
 {
 I=loadImage("lena.png");
 size(512, 512);
 ar=0;
 c=color(255, 255, 0);
 I.loadPixels();
 
 for (int i=0; i<I.width; i++)
 {
 I.pixels[pos(i, i, I.width)]=c; //Imposto la diagonale principale gialla
 }
 
 I.updatePixels();
 }
 
 void draw()
 {
 image(I, 0, 0);
 }
 
 void keyPressed()
 {
 if (key=='r'||key=='R')
 {
 if (key=='r')
 {
 ar--;
 } else if (key=='R')
 {
 ar++;
 }
 
 
 I.loadPixels();
 
 for (int i=0; i<I.pixels.length; i++) // Per le operazioni puntuali è necessario un ciclo for, due per quelle locali
 {
 c1=I.pixels[i];
 c1=color(red(c1)+ar, green(c1), blue(c1));
 I.pixels[i]=c1;
 }
 
 I.updatePixels();
 println(ar);
 }
 
 if (key=='i') //Inversione colore immagine
 {
 I.loadPixels();
 
 for (int i=0; i<I.pixels.length; i++) // Per le operazioni puntuali è necessario un ciclo for, due per quelle locali
 {
 c1=I.pixels[i];
 c1=255-color(red(c1), green(c1), blue(c1));
 I.pixels[i]=c1;
 }
 
 I.updatePixels();
 }
 
 if (key=='0') //Reset
 {
 setup();
 }
 }
 
 int pos(int x, int y, int w)
 {
 return y*w+x;
 }
 */

/*
*  CREAZIONE DI UN IMMAGINE
 */

PImage I;
color c;

void setup()
{
  I=createImage(500, 500, RGB);
  size(500, 500);
  I.loadPixels();

  for (int x=0; x<I.width; x++)
  {
    for (int y=0; y<I.height; y++)
    {
      c=color(lerp(0, 255, float(x)/width), lerp(0, 255, float(y)/height), 0); //lerp interpolazione lineare tra 0 e 255 del terzo parametro
      I.pixels[pos(x, y, I.width)]=c;
    }
  }

  I.updatePixels();
}

void draw()
{
  up(mouseX);
  image(I, 0, 0);
}

int pos(int x, int y, int w)
{
  return x+y*w;
}

void up(int mx)
{
  I.loadPixels();

  for (int x=0; x<I.width; x++)
  {
    for (int y=0; y<I.height; y++)
    {
      c=color(lerp(0, 255, float(x)/width), lerp(0, 255, float(y)/height), lerp(0,255,float(mx)/width));
      I.pixels[pos(x, y, I.width)]=c;
    }
  }

  I.updatePixels();
}

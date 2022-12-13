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

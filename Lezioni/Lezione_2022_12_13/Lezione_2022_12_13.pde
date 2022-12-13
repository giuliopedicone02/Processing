/*
*  INTRODUZIONE ALLE IMMAGINI IN PROCESSING
*/



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

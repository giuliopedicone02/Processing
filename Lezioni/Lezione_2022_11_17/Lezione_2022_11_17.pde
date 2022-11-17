/*
      TESTO e PFont
 */

void setup()
{
  size(500, 500);
  f=createFont("Calibri", 16);
  //f = loadFont("... .vlw") Da usare quando carichiamo un testo da Strumenti -> Crea font
  //println(PFont.list()); Elenca le famiglie dei font installati sul pc
  textAlign(CENTER, TOP); //Allineamento orizzontale, allineamento verticale
}

PFont f;
int y=height;
float s=50;
String nome="";

void draw()
{
  background(0);
  textSize(s);
  //text("Ciao Mondo!",width/2-25,height/2+25); //text("str",x,y)
  // text("Testo lungo lungo lungo lungo lungo lungo lungo lungo lungo lungo lungo lungo lungo", 0, y, width, height); //text("str",x,y,w,h);
  //s-=0.5;
  //y-=3;

  text(nome, width/2, height/2);
}

void keyTyped()
{
  if (key==BACKSPACE)
  {
    nome=nome.substring(0, nome.length()-1);
  }
  {
    nome+=key;
  }
}

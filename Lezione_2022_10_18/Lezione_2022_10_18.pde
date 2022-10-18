/*
*  INTRODUZIONE ALLE FUNZIONI setup() E draw()
*/

/*size(500,500);
background(random(255),random(255),random(255));

rectMode(CENTER);

fill(random(255),random(255),random(255));
rect(width/2,height/2,200,200,10); //Quinto parametro: border radius, oppure Quinto: bordo sx-alto, Sesto: dx-alto, Settimo: dx-basso, Ottavo: sx-basso
*/

/*
void setup(){
  println("Sono nel setup");
  frameRate(2); //Un frame per secondo - default: 60fps
}

void draw(){
  println("Sono nel draw e sono passati: "+frameCount+" frame e "+millis()/1000+" secondi");
  
}
*/

/*
*  INTRODUZIONE ALLE ANIMAZIONI
*/

/*
void setup(){
  size(500,500);
  strokeWeight(4);
}

int x=0;
int v=3;
int dir=1;

void draw(){
  background(255);
  line(x,0,x,height);
  line(0,x,width,x);
  
  if(x<0 || x>=width)
  {
    //x=0;
    dir=-dir;
  }
  x+=v*dir;
}
*/

/*
*  PACMAN
*/

/*
int a=45;
int va=3;
int v=5;
int dirA=1;
int x;
int d=1;

void setup(){
  size(500,500);
  x=width/2;
  fill(255,255,0);
}
void draw()
{
  background(0);
  
  if(d>0){
  arc(x,height/2,100,100,radians(a),radians(360-a));
  }
  else
  {
  arc(x,height/2,100,100,radians(180+a),radians(360+180-a));
  }
  
  if(a<0 || a>=45)
  {
    dirA=-dirA;
  }
  
  if(x<50||x>width-50)
  {
    d=-d;
  }
  
  x+=v*d; //Velocità sinistra destra
  a+=va*dirA; //Velocità apertura-chiusura bocca
}*/

/*
*  FRECCIA TRA beginShape() ed endShape()
*/

/*
void setup()
{
  size(500,500);
  background(0);
}

void draw()
{
  beginShape();
  fill(255,0,0);
  stroke(255);
  strokeWeight(2);
  vertex(180,82);
  vertex(207,36);
  vertex(214,63);
  vertex(407,11);
  vertex(412,30);
  vertex(219,82);
  vertex(226,109);
  endShape(CLOSE);
}
*/

/*
*  CURVA DI BEZIER
*/

/*
void setup()
{
  size(500,500);
  noFill();
}

void draw()
{
  background(200);
  fill(255,0,0,128);
  stroke(0,0,255);
  strokeWeight(10);
  point(185,50);
  point(190,300);
  stroke(255,0,0);
  strokeWeight(10);
  point(mouseX,mouseY);
  point(15,290);
  stroke(0);
  strokeWeight(1);
  line(185,50,mouseX,mouseY);
  line(15,290,190,300);
  strokeWeight(2);
  bezier(185,50,mouseX,mouseY,15,290,190,300);
}
*/

int q=30;
int d;

void setup()
{
  size(800,800);
  d=width/q;
  noStroke();
  noLoop();
}

void draw()
{
  background(0,0,255);
  for(int y=0; y<=height; y+=d)
  {
    for(int x=0; x<=width; x+=d)
    {
      fill(random(255),130);
      rect(x+random(-5,5),y+random(-5,5),d,d);
    }
  }
}

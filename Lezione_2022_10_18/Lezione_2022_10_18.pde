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
}

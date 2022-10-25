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

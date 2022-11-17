int d=20;
boolean flag=true;

void setup()
{
  size(500,500);
}
void draw()
{
  background(255);
  fill(255,0,0);
  ellipse(width/2,height/2,d,d);
  
  
  if(d>=150 || d<=30)
  {
    flag=!flag;
  }
  if(flag)
  d++;
  else
  d--;
 
}

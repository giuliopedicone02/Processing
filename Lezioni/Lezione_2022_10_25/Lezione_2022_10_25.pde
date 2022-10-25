int x;
int y;

void setup()
{
  size(500,500);
  x=width/2;
  y=width/2;
  noStroke();
}

void draw()
{
  background(255);
  
  for(int d=width; d>=50;d-=30)
  {
    fill(random(255),random(255),random(255));
    ellipse(x,y,d,d);
  }
  
  if(keyPressed)
  {
    if(key=='a'||(key==CODED && keyCode==LEFT))
    {
      x-=3;
    }
    if(key=='d'||(key==CODED && keyCode==RIGHT))
    {
      x+=3;
    }
    if(key=='w'||(key==CODED && keyCode==UP))
    {
      y-=3;
    }
    if(key=='s'||(key==CODED && keyCode==DOWN))
    {
      y+=3;
    }
  }
  
}

boolean go=true;

void mouseClicked()
{
  if(mouseButton==LEFT)
    {
      go=!go;
    }
    
    if(go)
    {
      loop();
    }else
    {
      noLoop();
    }
}

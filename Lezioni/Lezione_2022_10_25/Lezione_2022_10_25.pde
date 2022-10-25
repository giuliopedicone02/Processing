void setup()
{
  size(500,500);
  noStroke();
}

void draw()
{
  background(255);
  
  for(int d=width; d>=50;d-=30)
  {
    fill(random(255),random(255),random(255));
    ellipse(width/2,height/2,d,d);
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

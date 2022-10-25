void setup()
{
  size(320,320);

  strokeWeight(2);
  
  noFill();
  
  ellipseMode(CENTER);
}


int w=20;
int s=w;

void draw()
{
   background(255);
   
   line(0,height/2,width,width/2);
   
  
  for(int i=0; i<8; i++)
  {
    ellipse(s,height/2,s*2,s*2);
      s+=w;
  }

  noLoop();
}

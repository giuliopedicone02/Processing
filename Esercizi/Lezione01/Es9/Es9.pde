void setup()
{
  size(500,500);
  colorMode(GRAY,width+height);
  strokeWeight(0.2);
}

int n=3;
int s=width/n;
void draw()
{
  for(int x=0; x<=height;x+=s)
  {
    for(int y=0; y<=width;y+=s)
    {
      fill(x+y);
      rect(x,y,s,s);
    }
  }
}

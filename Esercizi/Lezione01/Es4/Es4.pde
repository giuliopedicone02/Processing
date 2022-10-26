void setup()
{
  size(500, 300);
  background(0);
  stroke(255);
  colorMode(RGB, width);
}

int q=4; //Numero di x
int s=width/q;

void draw()
{
  for (int y=s/2; y<=height; y+=s) {
    for (int x=s/2; x<=width; x+=s) {
      line(0+x,0+y,10+x,10+y);
      line(10+x,0+y,0+x,10+y);
    }
  }
}


// ellipse(x,y,s,s);

void setup()
{
  size(500,300);
  background(0);
  stroke(255);
}

int q=10; //Numero di x
int s=width/q;

void draw()
{
for(int y=s/2;y<=height;y+=s){
  for(int x=s/2;x<=width;x+=s){
    
      line(x,x,x,y);
      line(x,x,y,x);
         
    }
    
  }
}


 // ellipse(x,y,s,s);

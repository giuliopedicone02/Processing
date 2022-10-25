void setup()
{
  size(400,400);
  background(0);
  strokeWeight(0.1);

}
int q=15;
void draw()
{
 
    for(int i=0; i<=width/2;i+=q)
    {
      fill(255,255,255,20);
      rect(i,i,height/2,width/2);
    }    
}

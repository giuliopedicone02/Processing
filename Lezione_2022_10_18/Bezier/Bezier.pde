/*
*  CURVA DI BEZIER
*/

void setup()
{
  size(500,500);
  noFill();
}

void draw()
{
  background(200);
  fill(255,0,0,128);
  stroke(0,0,255);
  strokeWeight(10);
  point(185,50);
  point(190,300);
  stroke(255,0,0);
  strokeWeight(10);
  point(mouseX,mouseY);
  point(15,290);
  stroke(0);
  strokeWeight(1);
  line(185,50,mouseX,mouseY);
  line(15,290,190,300);
  strokeWeight(2);
  bezier(185,50,mouseX,mouseY,15,290,190,300);
}

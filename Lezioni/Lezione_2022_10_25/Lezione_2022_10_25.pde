/*
*  CERCHI CONCENTRICI CON MOVIMENTO WASD E FRECCE DIREZIONALI
 */

/*
int x;
int y;

void setup()
{
  size(500, 500);
  x=width/2;
  y=width/2;
  noStroke();
}

void draw()
{
  background(255);

  for (int d=width; d>=50; d-=30)
  {
    fill(random(255), random(255), random(255));
    ellipse(x, y, d, d);
  }

  if (keyPressed)
  {
    if (key=='a'||(key==CODED && keyCode==LEFT))
    {
      x-=3;
    }
    if (key=='d'||(key==CODED && keyCode==RIGHT))
    {
      x+=3;
    }
    if (key=='w'||(key==CODED && keyCode==UP))
    {
      y-=3;
    }
    if (key=='s'||(key==CODED && keyCode==DOWN))
    {
      y+=3;
    }
  }
}

boolean go=true;

void mouseClicked()
{
  if (mouseButton==LEFT)
  {
    go=!go;
  }

  if (go)
  {
    loop();
  } else
  {
    noLoop();
  }
}


*/
/*
*  INTERPOLAZIONE LINEARE lerp(valoreIniziale,valoreFinale,[0,1])
 */
 
/*

int x1=20;
int x2=250;
int y1=20;
int y2=400;
int q=20;

void setup()
{
  size(500, 500);
}

void draw()
{
  background(255);
  stroke(0);
  strokeWeight(1);
  line(x1, y1, x2, y2);
  stroke(255, 0, 0);
  strokeWeight(5);

  for (int i=0; i<=q; i++)
  {
    float x=lerp(x1, x2, (1.0/q)*i);
    float y=lerp(y1, y2, (1.0/q)*i);

    point(x, y);
  }
}

*/

/*
*  INTERPOLAZIONE LINEARE PER MOVIMENTO RALLENTATO
*/

/*

float x;
float y;

void setup()
{
  size(500,500);
  noStroke();
  fill(255);
  background(0);
}

void draw()
{
  fill(0,50);
  rect(0,0,width,height);
  x=lerp(x,mouseX,0.05);
  y=lerp(y,mouseY,0.05);
  fill(255);
  ellipse(x,y,50,50);
}
  
*/

/*
*  PAINT
*/

/*

void setup()
{
  size(500,500);
  background(255,255);
  strokeWeight(10);
  fill(0);
}
void draw()
{
  if(mousePressed)
  {
    //ellipse(mouseX,mouseY,10,10);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
}

void keyTyped()
{
  if(key=='r'||key=='R')
  {
    stroke(255,0,0);
  }
  
  if(key=='g'||key=='G')
  {
    stroke(0,255,0);
  }
  
  if(key=='b'||key=='B')
  {
    stroke(0,0,255);
  }
  
  if(key=='w'||key=='W')
  {
    stroke(255,255,255);
  }
}

*/

/*
*  FUNZIONE MAP(value, start1, stop1, start2, stop2)
*/

/*
int d=20;
int g=0;
int r=0;

void setup()
{
  size(500,500);
}

void draw()
{
  background(r,g,0);
  r=(int)map(mouseX,0,width,0,255);
  g=(int)map(mouseY,0,height,0,255);
  fill(map(d,20,width,0,255));
  ellipse(width/2,height/2,d,d);
  
  if(dist(width/2,height/2,mouseX,mouseY)<d/2)
  {
    d++;
  }
  else if(d>20)
  {
    d--;
  }
}

*/

int x;
int y;
int x2;

float xr;
float yr;

int w=50;
int h=30;

color c=color(255,255,0);

void setup()
{
  size(500,500);
  x=width/2-30;
  y=height/2;
  x2=width/2+30;
  xr=random(width-w);
  yr=random(height-h);
}

void draw()
{
  background(255,255,0);
  fill(255);
  ellipse(x,y,50,50);
  ellipse(x2,y,50,50);
  rect(xr,y,w,h);
  fill(0);
  float dx=map(mouseX,0,width,-15,15);
  float dy=map(mouseY,0,height,-15,15);
  ellipse(x+dx,y+dy,5,5);
  ellipse(x2+dx,y+dy,5,5);
}

void mousePressed()
{
  if(mouseX>=xr && mouseX<=xr+w && mouseY>=yr && mouseY<=yr+h)
  {
    c=color(random(255),random(255),random(255));
    xr=random(width-w);
    yr=random(height-h);
  }
}

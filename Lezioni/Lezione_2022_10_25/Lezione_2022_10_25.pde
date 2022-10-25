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
*  INTERPOLAZIONE LINEARE PER MOVIMENTO RALLENTATO
*/

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

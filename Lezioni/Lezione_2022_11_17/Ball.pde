class Ball
{
  float x, y, size, sx, sy;

  Ball(float x, float y, float size, float sx, float sy)
  {
    this.x=x;
    this.y=y;
    this.size=size;
    this.sx=sx;
    this.sy=sy;
  }

  Ball(float x, float y, float size)
  {
    this.x=x;
    this.y=y;
    this.size=size;
    this.sx=0;
    this.sy=0;
    
    //Oppure this(x,y,size,0,0)
  }
  
  void display()
  {
    fill(255,255,0);
    noStroke();
    ellipse(this.x,this.y,this.size,this.size);
  }
  
  void move()
  {
    x+=sx;
    y+=sy;
  }
  
  void bounce()
  {
    if(x<=size/2||x>=width-size/2)
    {
      sx=-sx;
    }
    
    if(x<=size/2||x>=height-size/2)
    {
      sy=-sy;
    }
  }
  
  void gravity()
  {
     sy+=0.1;
  }
  
  void run()
  {
    this.gravity();
    this.bounce();
    this.move();
    this.display();
  }
}

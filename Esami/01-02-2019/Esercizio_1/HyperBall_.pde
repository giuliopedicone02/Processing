class HyperBall extends Ball{
  color c;
  HyperBall(int x,int y,int r){
  super(x,y,r);
  c=color(0,0,255);
  }
  
  void move(){
  y+=vely;
  }
  
  void check(){
   //float d;
   //d=dist(mouseX,mouseY,this.x,this.y);
   //if(d<this.r) this.c=color(random(255),random(255),random(255));
   if(mouseX>x-r&&mouseX<x+r){
     if(mouseY>y-r&&mouseY<y+r){
       this.c=color(random(255),random(255),random(255));
   }
   }
  }
  void display(){
  fill(c);
  noStroke();
  ellipse(x,y,r,r);
  }
  
  void border(){
  if(y>256||y<0){
    vely=-vely;
    
  }
  }
  
  void run(){
  check();
  border();
  move();
  display();
  }
}

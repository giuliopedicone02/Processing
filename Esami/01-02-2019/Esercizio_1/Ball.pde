class Ball{
  int x,y,vely,r;
  Ball(int x,int y,int r){

  this.x=x;
  this.y=y;
  vely=5;
  this.r=r;
  }
  void move(){
  y+=vely;
  }
  
  void display(){
  fill(color(255,0,0));
  noStroke();
  ellipse(x,y,r,r);
  }
  
  void border(){
  if(y>256||y<0){
    vely=-vely;
    
  }
  }
  
  void run(){
  border();
  move();
  display();
  }
}

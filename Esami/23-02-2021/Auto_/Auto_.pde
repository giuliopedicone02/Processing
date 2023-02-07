class Auto{
  int x,y,velx,lun,alt;
  color c;
  Auto(int x,int y,int vel){
  c=color(0,255,0);
  this.x=x;
  this.y=y;
  this.velx=vel;
  lun=60;
  alt=30;
  }
  void move(){
  x+=velx;
  }
  
  void display(){
  fill(c);
  rect(x,y,lun,alt);
  }
  
  void border(){
  if(x>512){
    x=0;
    velx=int(random(2,11));
  }
  }
  
  void run(){
  border();
  move();
  display();
  }
}

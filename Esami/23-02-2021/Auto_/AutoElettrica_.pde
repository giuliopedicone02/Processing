class AutoElettrica extends Auto{
  boolean triangocond=true;
  AutoElettrica(int x,int y,int vel){
  super(x,y,vel);
  c=color(int(random(0,256)));
  }
  
  void border(){
  if(x>512){
  x=0;
  triangocond=!triangocond;
  }
  }
  
  void move(){
  x=x+(velx/2);
  }
  
  void display(){
  fill(c);
  rect(x,y,lun,alt);
  }
  
  void triangolo(){
    fill(255,255,0);
    triangle(x,(y+alt),x+(lun/2),y,x+lun,(y+alt));
  }
  void run(){
  border();
  move();
  display();
  if(triangocond) triangolo();
  }
}

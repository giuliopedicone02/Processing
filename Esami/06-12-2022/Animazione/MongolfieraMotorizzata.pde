class MongolfieraMotorizzata extends Mongolfiera{
  MongolfieraMotorizzata(int x,int y,int vel){
    super(x,y,vel);
    c=color(int(random(255)));
  }
  

  
  void display(){
  fill(c);
  rect(posx,posy,60,30);
  ellipse(posx+30,posy-50,70,70);
  line(posx,posy,posx-5,posy-50);
  line(posx+60,posy,posx+65,posy-50);
  }
  
  void border(){
  if(posx+60>512||posx<0){
    velx=-velx;
  }
  
  }
  
  void run(){
  border();
  move();
  display();
  }
}

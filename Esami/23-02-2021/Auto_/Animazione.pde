Auto a;
AutoElettrica ae;
void setup(){
  size(512,512);
  int speed=int(random(2,11));
  a=new Auto(0,height/3,speed);
  ae=new AutoElettrica(0,int((height*2)/3),speed/2);
}
void draw(){
  background(255);
  a.run();
  ae.run();
}

void keyPressed(){
  if(key=='r' || key=='R') setup();
}

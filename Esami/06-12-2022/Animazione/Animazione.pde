Mongolfiera m;
MongolfieraMotorizzata mm;
void setup(){
  size(512,512);
  int speed=int(random(2,11));
  m=new Mongolfiera(0,height/3,speed);
  mm=new MongolfieraMotorizzata(0,int((height*2)/3),speed/2);
}
void draw(){
  background(255);
  m.run();
  mm.run();
}

void keyPressed(){
  if(key=='r' || key=='R') setup();
}

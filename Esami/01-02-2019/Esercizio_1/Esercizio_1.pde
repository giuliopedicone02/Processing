Ball b;
HyperBall bb;
void setup(){
  size(512,256);
  background(255);
  b=new Ball(int(random(255)),int(random(255)),40);
  bb=new HyperBall(int(random(width/2,512)), int(random(255)), 40);
}
void draw(){
  background(255);
  b.run();
  bb.run();
}

void keyPressed(){
if(key=='R'||key=='r'){
  setup();
}
}

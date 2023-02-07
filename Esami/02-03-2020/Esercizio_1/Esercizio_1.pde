Monitor m;
OldMonitor om;
void setup() {
  size(512, 512);
  int vel=int(random(-5,6));
  background(255);
  m=new Monitor(10,10,vel,16*5,9*5);
  om=new OldMonitor(10,height-10-25*3,-vel,4*25,3*25);
}
void draw() {
  background(255);
  m.run();
  om.run();
}

void keyPressed() {
  if (key=='R'||key=='r') {
    setup();
  }
}

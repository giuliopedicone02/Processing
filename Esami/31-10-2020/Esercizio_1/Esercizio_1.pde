Balloon b;
YellowBalloon yb;
void setup() {
  size(512, 512);
  int vel=int(random(-5, 6));
  background(0, 255, 255);
  b=new Balloon (int(random(255)), int(random(255)), vel, 50, 100);
  yb=new YellowBalloon(100, 400, vel, (2*50)/3, (2*100)/3);
}
void draw() {
  background(0, 255, 255);
  b.run();
  yb.run();
}

void keyPressed() {
  if (key=='R'||key=='r') {
    setup();
  }
}

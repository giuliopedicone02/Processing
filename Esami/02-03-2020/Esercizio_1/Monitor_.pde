class Monitor {
  int posx,posy,velx,w,h;
  color c;
  Monitor(int posx,int posy,int velx,int w,int h) {
  this.posx=posx;
  this.posy=posy;
  this.velx=velx;
  this.w=w;
  this.h=h;
  c=color(random(255),random(255),random(255));
  }
  void move() {
  posx+=velx;
  }

  void display() {
  fill(c);
  stroke(255-red(c),255-green(c),255-blue(c));
  strokeWeight(5);
  rect(posx,posy,w,h);
  }

  void border() {
  if(posx>512-w||posx<0){
  velx=-velx;
  }
  }

  void run() {
    border();
    move();
    display();
  }
}

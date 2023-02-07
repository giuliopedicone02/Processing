class Balloon {
  int posx, posy, velx, w, h;
  color c;
  Balloon(int posx, int posy, int velx, int w, int h) {
    this.posx=posx;
    this.posy=posy;
    this.velx=velx;
    this.w=w;
    this.h=h;
    c=color(random(255), random(255), random(255));
  }


  void move() {
    posx+=velx;
  }

  void display() {
    fill(c);
    ellipse(posx, posy, w, h);
    stroke(255-red(c), 255-green(c), 255-blue(c));
    line(posx, posy+(h/2), posx, posy+(h/2)+h);
  }

  void border() {
    if (posx>512) {
      posx=0;
    }
    if (posx<0) {
      posx=512;
    }
  }

  void run() {
    border();
    move();
    display();
  }
}

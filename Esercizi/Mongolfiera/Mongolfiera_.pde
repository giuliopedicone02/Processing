class Mongolfiera {
  int posx, posy, velx, lun, alt, dia;
  color c;
  Mongolfiera(int x, int y, int vel) {
    this.posx=x;
    this.posy=y;
    this.velx=vel;
    lun=60;
    alt=30;
    dia=70;
  }
  void move() {
    posx+=velx;
  }

  void display() {
    fill(0, 255, 0);
    rect(posx, posy, 60, 30);
    ellipse(posx+30, posy-50, 70, 70);
    line(posx, posy, posx-5, posy-50);
    line(posx+60, posy, posx+65, posy-50);
  }

  void border() {
    if (posx>512) {
      posx=0;
    }
  }

  void run() {
    border();
    move();
    display();
  }
}

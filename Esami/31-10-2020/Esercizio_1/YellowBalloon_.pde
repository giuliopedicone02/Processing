class YellowBalloon extends Balloon {
  boolean cond=true;
  YellowBalloon(int posx, int posy, int velx, int w, int h) {
    super(posx, posy, velx, w, h);
  }

  void move() {
    posx+=velx;
  }

  void display() {
    if (mouseX>=posx-w/2 && mouseX<=posx+w/2 && mouseY>=posy-h/2 && mouseY<=posy+h/2) {
      cond=false;
      fill(255, 255, 0);
      ellipse(posx, posy, w, h);
      stroke(0, 0, 255);
      line(posx, posy+(h/2), posx, posy+(h/2)+h);
    } else {
      cond=true;
      fill(255, 255, 0);
      ellipse(posx, posy, w, h);
      stroke(0, 0, 255);
      line(posx, posy+(h/2), posx, posy+(h/2)+h);
    }
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
    if (cond)move();
    display();
  }
}

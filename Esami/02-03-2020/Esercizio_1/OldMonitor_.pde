class OldMonitor extends Monitor {
  boolean cond=true;

  OldMonitor(int posx, int posy, int velx, int w, int h) {
    super(posx, posy, velx, w, h);
  }

  void move() {
    posx+=velx;
  }

  void display() {
    if (mouseX>=posx && mouseX<=posx+w && mouseY>=posy && mouseY<=posy+h) {
      fill(0);
      stroke(255, 255, 255);
      strokeWeight(5);
      rect(posx, posy, w, h);
      line(posx, posy+(h/2), posx+w, posy+(h/2));
      cond=false;
    } else {
      cond=true;
      fill(0, 255, 0);
      stroke(128, 128, 128);
      strokeWeight(5);
      rect(posx, posy, w, h);
    }
  }

  void run() {
    border();
    if (cond)move();
    display();
  }
}

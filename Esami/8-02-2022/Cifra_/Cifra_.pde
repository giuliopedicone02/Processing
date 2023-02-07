class Cifra{
int posx,posy,vely,dimensione;
char num;
color c;
Cifra(char num,int posx,int posy,int vely){
  this.num=num;
  this.posx=posx;
  this.posy=posy;
  this.vely=vely;
  dimensione=32;
  c=color(255,255,0);
}
void move(){
  posy+=vely;
  }
  
  void display(){
  fill(c);
  textSize(dimensione);
  text(num,posx,posy);
  }
  
  void border(){
  if(posy>500){
    posy=0;
    posx=int(random(500));
  }
  }
  
  void run(){
  border();
  move();
  display();
  }

}

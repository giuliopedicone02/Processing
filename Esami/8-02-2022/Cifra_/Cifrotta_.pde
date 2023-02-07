class Cifrotta extends Cifra{
color c;
Cifrotta(char num,int posx,int posy,int vely){
  super(num,posx,posy,vely);
  c=color(255);
}
void move(){
  posy=posy-vely;
  }
  
  void display(){
  noFill();
  stroke(255);
  ellipse(posx,posy-10,dimensione,dimensione);
  fill(c);
  textSize(dimensione);
  text(num,posx,posy);
  }
  
  void border(){
  if(posy<0){
    posy=500;
    posx=int(random(500));
  }
  }
  
  void run(){
  border();
  move();
  display();
  }

}

PImage Im;
void setup(){
  size(512,256);
  Im=loadImage("lena.png");
  Im.resize(256,256);
  Im.filter(GRAY);
  image(Im,0,0);
  image(rev(Im),256,0);
}


PImage rev(PImage I){
  PImage R=I.copy();
  PImage sx,dx;
  sx=R.get(0,0,R.width/2,R.height);
  dx=R.get(R.width/2,0,R.width/2,R.height);
  
  R.set(0,0,dx);
  R.set(R.width/2,0,sx);
  
  for(int i=0;i<R.width;i++){
    R.set(i,i,color(random(255),random(255),random(255)));
  }
  
  return R;
}
void draw(){}
void keyPressed(){
  if(key=='r' || key=='R') setup();
}

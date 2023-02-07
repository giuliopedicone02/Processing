PImage Im;
void setup(){
  size(768,256);
  Im=loadImage("lena.png");
  Im.resize(256,256);
  Im.filter(GRAY);
  image(Im,0,0);
  image(rev(Im),256,0);
  image(med(rev(Im),int(random(5,16))),512,0);
}
void draw(){}

PImage rev(PImage I){
  PImage R=I.copy();
  PImage sx,dx;
  sx=R.get(0,0,R.width/2,R.height);
  dx=R.get(R.width/2,0,R.width/2,R.height);
  
  R.set(0,0,dx);
  R.set(R.width/2,0,sx);
  
  for(int i=0;i<R.width;i++){
    R.set(i,i,color(255,255,0));
  }
  return R;
}

PImage med(PImage I,int n){
  PImage res = createImage(I.width, I.height, RGB);
  PImage tmp;
  int off = n/2;
  float[] tmpF;
  tmpF= new float[n*n];
  float med;
  for(int x = 0; x < I.width; x++){
    for(int y = 0; y < I.height; y++){
      tmp = I.get(x-off, y-off, n, n);
      tmp.loadPixels();
      for(int i = 0; i < tmp.pixels.length; i++){
        tmpF[i] = green(tmp.pixels[i]);
      }
      tmpF = sort(tmpF);
      if((n*n) % 2 == 1){
        med = tmpF[(n*n)/2];
      }
      else{
        med = (tmpF[(n*n)/2] + tmpF[(n*n)/2-1])/2;
      }
      res.set(x, y, color(med));
    }
  }
  return res;
}

void keyPressed(){
  if(key=='r'||key=='R'){
  setup();
}
}

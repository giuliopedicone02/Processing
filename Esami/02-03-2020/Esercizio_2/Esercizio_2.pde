PImage Im;
void setup(){
  int h=int(random(1,257));
  int k=int(random(1,257));
  int n=int(random(5,16));
  size(768,256);
  Im=loadImage("lena.png");
  Im.resize(256,256);
  Im.filter(GRAY);
  image(Im,0,0);
  image(linee(Im,h,k),256,0);
  image(linee(Im,h,k,n),512,0);
}

PImage linee(PImage I, int h, int k){
  PImage R=I.copy();
  for(int i=0;i<R.width;i++){
    R.set(i,h,color(255,255,0));
    R.set(i,k,color(255,255,0));
    R.set(k,i,color(255,255,0));
    R.set(h,i,color(255,255,0));
    R.set(k,i,color(255,255,0));
    R.set(i,i,color(0));
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

PImage linee(PImage I, int h, int k,int n){
  PImage R=med(I,n);
  
  return linee(R,h,k);
}
void draw(){}
void keyPressed(){
  if(key=='r' || key=='R') setup();
}

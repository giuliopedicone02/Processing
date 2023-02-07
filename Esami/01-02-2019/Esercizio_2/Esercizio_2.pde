PImage Im;
void setup(){
  size(768,256);
  Im=loadImage("lena.png");
  Im.resize(256,256);
  Im.filter(GRAY);
  int h=int(random(1,257));
  int k=int(random(1,257));
  image(Im,0,0);
  image(hash(Im,h,k),256,0);
  image(hash(Im,h,k,int(random(3,12))),512,0);
}
void draw(){}

PImage hash(PImage I,int h,int k){
  PImage R=I.copy();
  for(int i=0;i<R.width;i++){
    R.set(i,h,color(0));
    R.set(i,k,color(0));
    R.set(h,i,color(0));
    R.set(k,i,color(0));
  }
  return R;
}

PImage hash(PImage I,int h,int k,int n){
  
  
  PImage R=mas(I,n);
  for(int i=0;i<R.width;i++){
    R.set(i,h,color(0));
    R.set(i,k,color(0));
    R.set(h,i,color(0));
    R.set(k,i,color(0));
  }
  return R;
}

PImage mas(PImage i, int n)
{
  PImage img=createImage(i.width, i.height, RGB);
  PImage iTmp;
  int offset=n/2;
  float[] tmpP;
  tmpP=new float[n*n];
  for(int x=0; x<i.width; x++)
  {
     for(int y=0;y<i.height; y++)
     {
       iTmp=i.get(x-offset,y-offset,n,n); 
       iTmp.loadPixels();
       for(int j=0; j<iTmp.pixels.length;j++)
       {
         tmpP[j]=green(iTmp.pixels[j]);
       }
       img.set(x,y,color(max(tmpP)));
     }
  }
  return img;
}

void keyPressed(){
if(key=='R'||key=='r'){
  setup();
}
}

PImage Im;
void setup(){
  size(768,256);
  Im=loadImage("lena.png");
  Im.filter(GRAY);
  Im.resize(256,256);
  image(Im,0,0);
  image(wow(Im),256,0);
  image(mas(wow(Im),int(random(5,16))),512,0);
}

void draw(){}

PImage wow(PImage I){
  PImage R=I.copy();
  PImage p1,p2;
  
  p1=R.get(0,R.height/2,R.width,R.height);
  p2=R.get(0,0,R.width,R.height/2);
  
  R.set(0,0,p1);
  R.set(0,R.height/2,p2);
  
  
  for(int i=I.width/2; i<I.width; i++)
  R.set(i,i, color(255));
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

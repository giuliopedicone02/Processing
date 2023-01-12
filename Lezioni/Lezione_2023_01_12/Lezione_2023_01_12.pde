/*
*  Quantizzazione L'=(L*K)/N
 */

/*

 PImage Im, Iq;
 int K;
 void setup()
 {
 K=2;
 Im=loadImage("lena.png");
 Im.filter(GRAY);
 size(1024, 512);
 image(Im, 0, 0);
 
 Iq=quantizza(Im, K);
 image(Iq, 512, 0);
 }
 
 void draw()
 {
 }
 
 
 PImage quantizza(PImage I, int k)
 {
 PImage R=I.copy();
 
 R.loadPixels();
 
 int q;
 for (int i=0; i<R.pixels.length; i++)
 {
 q=floor((blue(R.pixels[i])*k)/256);
 q= int((float(q)/(k-1))*255);
 //q=int(lerp(0,255,float(q)/(k-1)));
 
 R.pixels[i]=color(q);
 }
 R.updatePixels();
 return R;
 }
 
 void keyPressed()
 {
 if ((key=='+')&&(K<256))
 {
 K++;
 image(quantizza(Im, K), 512, 0);
 println(K);
 }
 
 if ((key=='-')&&(K>2))
 {
 K--;
 image(quantizza(Im, K), 512, 0);
 println(K);
 }
 }
 
 */

/*
*  MSE e PSNR
 */

/*

 PImage Im, Ic, Ir;
 float mseO, mseP, mseR, psnrO, psnrP, psnrR;
 void setup()
 {
 
 Im=loadImage("lena.png");
 Im.filter(GRAY);
 size(1536, 512);
 background(0);
 
 Ic=Im.copy();
 Ic.resize(256, 256);
 Ic.resize(512, 512);
 
 Ir=Im.copy();
 Ir.resize(256, 256);
 Ir=replication2x(Ir);
 
 mseO=MSE(Im, Im);
 mseP=MSE(Im, Ic);
 mseR=MSE(Im, Ir);
 
 psnrO=PSNR(Im, Im);
 psnrP=PSNR(Im, Ic);
 psnrR=PSNR(Im, Ir);
 
 println("MSE con se stessa: " + mseO);
 println("MSE processing: " + mseP);
 println("MSE replication: " + mseR);
 
 println("PSNR con se stessa: " + psnrO);
 println("PSNR processing: " + psnrP);
 println("PSNR replication: " + psnrR);
 
 image(Im, 0, 0);
 image(Ic, 512, 0);
 image(Ir, 1024, 0);
 }
 
 void draw()
 {
 }
 
 PImage replication2x(PImage I)
 {
 PImage R=createImage(2*I.width, 2*I.height, RGB);
 
 for (int x=0; x<I.width; x++)
 {
 for (int y=0; y<I.height; y++)
 {
 
 R.set(2*x, 2*y, I.get(x, y));
 
 R.set(2*x+1, 2*y, I.get(x, y));
 R.set(2*x, 2*y+1, I.get(x, y));
 R.set(2*x+1, 2*y+1, I.get(x, y));
 }
 }
 
 return R;
 }
 
 float MSE(PImage I1, PImage I2)
 {
 float res=0;
 
 I1.loadPixels();
 I2.loadPixels();
 
 for (int i=0; i<I1.pixels.length; i++)
 {
 res+=pow(blue(I1.pixels[i])-blue(I2.pixels[i]), 2);
 }
 
 res=res/I1.pixels.length;
 
 return res;
 }
 
 float PSNR(PImage I1, PImage I2)
 {
 float res=0;
 
 float mse=MSE(I1, I2);
 
 res=10*log(255*255/mse)/log(10);
 return res;
 }
 
 */

/*
* OPERAZIONI AFFINI - Rotazione
 */

/*

 PImage Im, Ir, Iri;
 int ang=0;
 void setup()
 {
 Im=loadImage("lena.png");
 
 size(1025, 512);
 Ir=rotateF(Im, radians(ang));
 Iri=rotateI(Im, radians(ang));
 
 //image(Im,0,0);
 image(Ir, 0, 0);
 image(Iri, 512, 0);
 }
 
 void draw()
 {
 }
 
 //Rotazione con forward mapping
 PImage rotateF(PImage I, float theta)
 {
 PImage R=createImage(I.width, I.height, RGB);
 
 R.loadPixels();
 for (int i=0; i<R.pixels.length; i++)
 {
 R.pixels[i]=color(0);
 }
 
 float x, y;
 float u1, v1;
 for (int u=0; u<I.width; u++)
 {
 for (int v=0; v<I.height; v++)
 {
 //Questa traslazione serve ad effettuare l'operazione rispetto al centro dell'immagine
 u1=u-I.width/2;
 v1=v-I.height/2;
 
 x=u1*cos(theta)-v1*sin(theta);
 y=u1*sin(theta)+v1*cos(theta);
 
 //Devo aggiustare le coordinate poiché il calcolo è avvenuto rispetto al centro
 x=x+I.width/2;
 y=y+I.height/2;
 
 R.set(round(x), round(y), I.get(u, v));
 }
 }
 
 return R;
 }
 
 
 //Rotazione con inverse mapping
 PImage rotateI(PImage I, float theta)
 {
 PImage R=createImage(I.width, I.height, RGB);
 
 R.loadPixels();
 for (int i=0; i<R.pixels.length; i++)
 {
 R.pixels[i]=color(0);
 }
 
 float u, v;
 float x1, y1;
 
 for (int x=0; x<I.width; x++)
 {
 for (int y=0; y<I.height; y++)
 {
 
 x1=x-I.width/2;
 y1=y-I.height/2;
 
 u=x1*cos(theta)+y1*sin(theta);
 v=-x1*sin(theta)+y1*cos(theta);
 
 u=u+I.width/2;
 v=v+I.height/2;
 
 R.set(x, y, I.get(round(u), round(v)));
 }
 }
 
 return R;
 }
 
 void keyPressed() {
 if (key=='+') {
 ang+=5;
 }
 if (key=='-') {
 ang-=5;
 }
 ang=ang%360;
 println(ang);
 Ir=rotateF(Im, radians(ang));
 Iri=rotateI(Im, radians(ang));
 
 //image(Im,0,0);
 image(Ir, 0, 0);
 image(Iri, 512, 0);
 //setup();
 }
 
 */

/*
* OPERAZIONI AFFINI - Scaling
 */

/*

 PImage Im, Is, Isi;
 float scale=1;
 void setup()
 {
 Im=loadImage("lena.png");
 
 
 size(1024, 512);
 
 
 Is=scaleF(Im, scale, scale);
 
 Isi=scaleI(Im, scale, scale);
 
 
 //image(Im,0,0);
 
 image(Is, 0, 0);
 image(Isi, 512, 0);
 }
 
 void draw()
 {
 }
 
 
 
 //Scaling con forward mapping
 PImage scaleF(PImage I, float sx, float sy)
 {
 PImage R=createImage(I.width, I.height, RGB);
 
 R.loadPixels();
 for (int i=0; i<R.pixels.length; i++)
 {
 R.pixels[i]=color(0);
 }
 
 float x, y;
 float u1, v1;
 for (int u=0; u<I.width; u++)
 {
 for (int v=0; v<I.height; v++)
 {
 
 u1=u-I.width/2;
 v1=v-I.height/2;
 
 x=u1*sx;
 y=v1*sy;
 
 x=x+I.width/2;
 y=y+I.height/2;
 
 R.set(round(x), round(y), I.get(u, v));
 }
 }
 
 return R;
 }
 
 
 
 //Scaling con inverse mapping
 PImage scaleI(PImage I, float sx, float sy)
 {
 PImage R=createImage(I.width, I.height, RGB);
 
 R.loadPixels();
 for (int i=0; i<R.pixels.length; i++)
 {
 R.pixels[i]=color(0);
 }
 
 float u, v;
 float x1, y1;
 
 for (int x=0; x<I.width; x++)
 {
 for (int y=0; y<I.height; y++)
 {
 
 x1=x-I.width/2;
 y1=y-I.height/2;
 
 u=x1*1/sx;
 v=y1*1/sy;
 
 u=u+I.width/2;
 v=v+I.height/2;
 
 R.set(x, y, I.get(round(u), round(v)));
 }
 }
 
 return R;
 }
 
 
 
 void keyPressed() {
 if (key=='+') {
 scale+=.1;
 }
 if (key=='-' && scale>1) {
 scale-=.1;
 }
 
 println(scale);
 Is=scaleF(Im, scale, scale);
 Isi=scaleI(Im, scale, scale);
 
 
 //image(Im,0,0);
 
 image(Is, 0, 0);
 image(Isi, 512, 0);
 }
 
 */

/*
* ESPANSIONE DEL CONTRASTO (contrast stretching)
 */

/*

 PImage Im, Is, Ie;
 float [] H1, H2, H3;
 
 void setup()
 {
 size(1536, 512);
 Im=loadImage("lena.png");
 Im.filter(GRAY);
 
 Is=stretching(Im);
 Ie=equalizza(Im);
 
 H1=istogramma(Im);
 H2=istogramma(Is);
 H3=istogramma(Ie);
 
 image(Im, 0, 0);
 image(Is, 512, 0);
 image(Ie, 1024, 0);
 
 for (int i=0; i<256; i++)
 {
 println(i+": "+H1[i]+"\t\t\t"+H2[i]+"\t\t\t"+H3[i]);
 }
 }
 
 void draw()
 {
 }
 
 PImage equalizza(PImage I)
 {
 PImage R=I.copy();
 float [] H =istogramma(I);
 
 //Istogramma cumulativo
 for (int i=1; i<256; i++)
 {
 H[i]=H[i-1]+H[i];
 }
 
 R.loadPixels();
 
 for (int i=0; i<R.pixels.length; i++)
 {
 R.pixels[i]=color(255*H[int(red(R.pixels[i]))]);
 }
 
 R.updatePixels();
 return R;
 }
 
 PImage stretching(PImage I)
 {
 PImage R=I.copy();
 float max, min;
 R.loadPixels();
 max=red(R.pixels[0]);
 min=red(R.pixels[0]);
 
 for (int i=0; i<R.pixels.length; i++)
 {
 if (red(R.pixels[i])<min)
 {
 min=red(R.pixels[i]);
 }
 if (red(R.pixels[i])>max)
 {
 max=red(R.pixels[i]);
 }
 }
 
 for (int i=0; i<R.pixels.length; i++)
 {
 R.pixels[i]=color(255*(red(R.pixels[i])-min)/(max-min));
 }
 
 R.updatePixels();
 return R;
 }
 
 
 float [] istogramma(PImage I)
 {
 float[] H= new float[256];
 
 for (int i=0; i<256; i++)
 {
 H[i]=0;
 }
 
 I.loadPixels();
 
 for (int i=0; i<I.pixels.length; i++)
 {
 H[int(red(I.pixels[i]))]++;
 }
 
 for (int i=0; i<256; i++)
 {
 H[i]=H[i]/I.pixels.length;
 }
 
 return H;
 }
 
 */

/*
* ESPANSIONE DEL CONTRASTO CON ISTOGRAMMA (contrast stretching)
 */

/*
PImage Im, Is, Ie;
 float [] H1, H2, H3;
 void setup() {
 size(1536, 812);
 background(0);
 
 Im=loadImage("lena.png");
 Im.filter(GRAY);
 
 Is=stretching(Im);
 Ie=equalizza(Im);
 
 H1=istogramma(Im);
 H2=istogramma(Is);
 H3=istogramma(Ie);
 
 image(Im, 0, 0);
 image(Is, 512, 0);
 image(Ie, 1024, 0);
 
 
 rectMode(CORNERS);
 noStroke();
 fill(255, 255, 0);
 for (int i=0; i<256; i++) {
 rect(i*2, height-(H1[i]*256*100), i*2+2, height);
 rect(Im.width+i*2, height-(H2[i]*256*100), Im.width+i*2+2, height);
 rect(Im.width*2+i*2, height-(H3[i]*256*100), Im.width*2+i*2+2, height);
 }
 }
 
 void draw() {
 }
 
 PImage equalizza(PImage I) {
 PImage R=I.copy();
 float [] H =istogramma(I);
 
 //Istogramma cumulativo
 for (int i=1; i<256; i++) {
 H[i]=H[i-1]+H[i];
 }
 
 R.loadPixels();
 
 for (int i=0; i<R.pixels.length; i++) {
 R.pixels[i]=color(255*H[int(red(R.pixels[i]))]);
 }
 
 R.updatePixels();
 return R;
 }
 
 PImage stretching(PImage I) {
 PImage R=I.copy();
 float max, min;
 R.loadPixels();
 max=red(R.pixels[0]);
 min=red(R.pixels[0]);
 
 for (int i=0; i<R.pixels.length; i++) {
 if (red(R.pixels[i])<min) {
 min=red(R.pixels[i]);
 }
 if (red(R.pixels[i])>max) {
 max=red(R.pixels[i]);
 }
 }
 
 for (int i=0; i<R.pixels.length; i++) {
 R.pixels[i]=color(255*(red(R.pixels[i])-min)/(max-min));
 }
 R.updatePixels();
 return R;
 }
 
 
 float [] istogramma(PImage I) {
 float[] H= new float[256];
 for (int i=0; i<256; i++) {
 H[i]=0;
 }
 
 I.loadPixels();
 
 for (int i=0; i<I.pixels.length; i++) {
 H[int(red(I.pixels[i]))]++;
 }
 
 for (int i=0; i<256; i++) {
 H[i]=H[i]/I.pixels.length;
 }
 
 return H;
 }
 */

/*
* OPERAZIONI PUNTUALI
 */

/*

 PImage Im, ImN, ImG, ImL;
 void setup()
 {
 Im=loadImage("lena.png");
 Im.resize(256, 256);
 size(512, 512);
 image(Im, 0, 0);
 
 ImN=negativo(Im);
 image(ImN, 256, 0);
 
 ImG=gamma(Im, 2);
 image(ImG, 0, 256);
 ImL=logaritmo(Im);
 image(ImL, 256, 256);
 }
 
 void draw()
 {
 }
 
 PImage negativo(PImage I)
 {
 PImage R=I.copy();
 
 //I.loadPixels();
 R.loadPixels();
 
 float r, g, b;
 for (int i=0; i<R.pixels.length; i++)
 {
 r=255-red(R.pixels[i]);
 g=255-green(R.pixels[i]);
 b=255-blue(R.pixels[i]);
 
 R.pixels[i]=color(r, g, b);
 }
 
 R.updatePixels();
 
 return R;
 }
 
 PImage gamma(PImage I, float gm)
 {
 PImage R=createImage(I.width, I.height, RGB);
 
 R.loadPixels();
 I.loadPixels();
 
 float r, g, b;
 float C=1/pow(255, gm-1);
 
 for (int i=0; i<R.pixels.length; i++)
 {
 r=C*pow(red(I.pixels[i]), gm);
 g=C*pow(green(I.pixels[i]), gm);
 b=C*pow(blue(I.pixels[i]), gm);
 
 R.pixels[i]=color(r, g, b);
 }
 R.updatePixels();
 return R;
 }
 
 PImage logaritmo(PImage I)
 {
 PImage R=createImage(I.width, I.height, RGB);
 
 R.loadPixels();
 I.loadPixels();
 
 float r, g, b;
 float C=255/log(256);
 
 for (int i=0; i<R.pixels.length; i++)
 {
 r=C*log(1+red(I.pixels[i]));
 g=C*log(1+green(I.pixels[i]));
 b=C*log(1+blue(I.pixels[i]));
 
 R.pixels[i]=color(r, g, b);
 }
 R.updatePixels();
 return R;
 }
 
 */

/*
* OPERAZIONI PUNTUALI CON MOUSE
 */

//Esercizio in cui si implementa un metodo che applica un operatore solo ad una sottoimmagine. 
//Il metodo prende in input le coordinate del
//centro della sottoimmagine e la dimensione della sottoimmagine.
//Nello sketch si usa il mouse per applicare l'operazione, mostrando anche un quadrato che delimita la zona da elaborare
//Con + e - si possono variare le dimensioni dell'area da elaborare.

PImage Im, IL;
int K=75;
void setup()
{
  Im=loadImage("lena.png");
  IL=Im.copy();
  size(512, 512);
  image(Im, 0, 0);
}

void draw()
{
  image(IL, 0, 0);

  noFill();
  strokeWeight(3);
  stroke(0, 255, 0);
  rectMode(CENTER);

  rect(mouseX, mouseY, K, K);
}


void mousePressed()
{
  //L'ultimo parametro indica l'operazione.
  //Abbiamo associato a 0 il negativo, a 1 il logaritmo e a 2 gamma.
  IL=applyOperator(IL, mouseX, mouseY, K, 2);
}

void keyPressed()
{
  if ((key=='+')&&(K<511))
    K+=2;
  if ((key=='-')&&(K>3))
    K-=2;
}
PImage applyOperator(PImage I, float x, float y, int n, int s)
{
  PImage res=I.copy();

  PImage tmp;
  tmp=I.get(int(x)-n/2, int(y)-n/2, n, n);

  switch(s)
  {
  case 0:
    res.set(int(x)-n/2, int(y)-n/2, negativo(tmp));
    break;
  case 1:
    res.set(int(x)-n/2, int(y)-n/2, logaritmo(tmp));
    break;
  case 2:
    res.set(int(x)-n/2, int(y)-n/2, gamma(tmp, 2));
    break;
  default:
    ;
  }
  return res;
}

PImage negativo(PImage I)
{
  PImage R=I.copy();

  //I.loadPixels();
  R.loadPixels();

  float r, g, b;
  for (int i=0; i<R.pixels.length; i++)
  {
    r=255-red(R.pixels[i]);
    g=255-green(R.pixels[i]);
    b=255-blue(R.pixels[i]);

    R.pixels[i]=color(r, g, b);
  }

  R.updatePixels();

  return R;
}

PImage gamma(PImage I, float gm)
{
  PImage R=createImage(I.width, I.height, RGB);

  R.loadPixels();
  I.loadPixels();

  float r, g, b;
  float C=1/pow(255, gm-1);

  for (int i=0; i<R.pixels.length; i++)
  {
    r=C*pow(red(I.pixels[i]), gm);
    g=C*pow(green(I.pixels[i]), gm);
    b=C*pow(blue(I.pixels[i]), gm);

    R.pixels[i]=color(r, g, b);
  }
  R.updatePixels();
  return R;
}

PImage logaritmo(PImage I)
{
  PImage R=createImage(I.width, I.height, RGB);

  R.loadPixels();
  I.loadPixels();

  float r, g, b;
  float C=255/log(256);

  for (int i=0; i<R.pixels.length; i++)
  {
    r=C*log(1+red(I.pixels[i]));
    g=C*log(1+green(I.pixels[i]));
    b=C*log(1+blue(I.pixels[i]));

    R.pixels[i]=color(r, g, b);
  }
  R.updatePixels();
  return R;
}

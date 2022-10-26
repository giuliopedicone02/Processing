void setup()
{
  size(500,500);
  strokeWeight(10);
  stroke(0);
}

void draw()
{
  background(0);
  
  fill(255);
  ellipse(width/2,height/2,300,300); //Viso del gatto
  
  strokeWeight(0);
  triangle(135,170,190,120,120,95); //Orecchio sinistro
  
  triangle(325,125,370,175,390,95); //Orecchio destro
  
  fill(0);
  ellipse(150,130,10,10);
  ellipse(360,130,10,10);
  
  fill(0);
  strokeWeight(10);
  triangle(width/2-20,height/2+40,width/2+20,height/2+40,width/2,height/2+70); //Naso
  
  line(width/2-110,height/2-20,width/2-40,height/2); //occhio sinistro
  
  line(width/2+110,height/2-20,width/2+40,height/2); //occhio destro
}

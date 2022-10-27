void setup()
{
  size(500,500);
  strokeWeight(5);
  stroke(0);
}

void draw()
{
  background(255);
  
  rectMode(CENTER);
  rect(width/2,height/2+50,200,200);
  triangle(width/2-100,height/2-50,width/2+100,height/2-50,width/2,height/2-200);
  
  rectMode(CORNERS);
  //rect(width/2-25,height/2+50,width/2+25,height/2+50,width/2-25,height/2+100,width/2+25,height/2+100);
  line(width/2-25,height/2+50,width/2+25,height/2+50);
  line(width/2-25,height/2+50,width/2-25,height/2+150);
  line(width/2+25,height/2+50,width/2+25,height/2+150);
  
  ellipse(width/2,height/2,50,50);
  line(width/2-25,height/2,width/2+25,height/2);
  line(width/2,height/2-25,width/2,height/2+25);
}

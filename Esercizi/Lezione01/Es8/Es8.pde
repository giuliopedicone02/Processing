void setup()
{
  size(500, 500);
  strokeWeight(2);
}


void draw()
{
  background(202, 218, 255);

  stroke(0, 141, 0);
  line(width/2, height/4, width/2, height-(height/3));


  noStroke();
  ellipseMode(CORNER);

  fill(170, 0, 170);
  ellipse(width/2, height/4, 100, 100);
  ellipse(width/2-100, height/4, 100, 100);
  ellipse(width/2-100, height/4-100, 100, 100);
  ellipse(width/2, height/4-100, 100, 100);
  
  ellipseMode(CENTER);
  fill(213,0,213);
  ellipse(width/2,height/4,width/2-75,height/4);
  ellipse(width/2,height/4,width/2-100,height/4+50);
  
  fill(255,0,255);

  ellipseMode(CENTER);
  fill(213, 0, 0);
  ellipse(width/2, height/4, 70, 70);
}

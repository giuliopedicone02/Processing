/*size(500,500);
background(random(255),random(255),random(255));

rectMode(CENTER);

fill(random(255),random(255),random(255));
rect(width/2,height/2,200,200,10); //Quinto parametro: border radius, oppure Quinto: bordo sx-alto, Sesto: dx-alto, Settimo: dx-basso, Ottavo: sx-basso
*/
void setup(){
  println("Sono nel setup");
  frameRate(2); //Un frame per secondo - default: 60fps
}

void draw(){
  println("Sono nel draw e sono passati: "+frameCount+" frame e "+millis()/1000+" secondi");
  
}

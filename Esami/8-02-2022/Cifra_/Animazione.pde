ArrayList<Cifra> c;
ArrayList<Cifrotta> C;

void setup(){
  size(500,500);
  background(0);
  ellipseMode(CENTER);
  textAlign(CENTER);
  c = new ArrayList<Cifra>(); 
  C = new ArrayList<Cifrotta>();
}

void draw(){
  background(0);
    for(Cifra i:c)
        i.run();

    for(Cifrotta j:C)
        j.run();
}

void mouseClicked(){
    if(mouseButton==RIGHT){
    setup();
}
}

void keyPressed(){
    switch (key) {
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
            c.add(new Cifra(key, int(random(0,501)), int(random(0,501)), int(random(2,11))));
            break;

        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            C.add(new Cifrotta(key, int(random(0,501)), int(random(0,501)), int(random(2,11))));
            break;
        default :
            println("inserisci una cifra");
            break;  
    }
}

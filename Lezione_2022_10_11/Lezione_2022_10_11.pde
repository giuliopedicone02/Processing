size(500,300); //Imposta la dimensione della finestra di output

background(0,0,255); //Utilizza il metodo RGB per cambiare lo sfondo
background(128); //Utilizza il metodo Scala di Grigi per cambiare lo sfondo

//circle(250,150,250); //Prevede tre parametri float: distanza dal lato sinistro, distanza da sopra ed il diametro in pixel del cerchio

//ellipseMode(CENTER); //Default
//ellipseMode(CORNER); //Da adesso interpreta i primi due parametri di ellipse() come le coordinate del punto dal quale verrà disegnata
//ellipseMode(CORNERS); //Da adesso il primo parametro di ellipse è il punto in alto a sinistra dal quale verrà disegnata l'ellisse ed il secondo parametro il punto in basso a destra dove termina l'ellisse 
//ellipseMode(RADIUS); //Da adesso interpreta il terzo e quarto parametro di ellipse() come raggio e non come diametro

//ellipse(250,150,125,250); //Prevede quattro parametri: (x centro, y centro, raggio orizzontale, raggio verticale)

//ellipse(0,0,width,height); //In modalità CORNERS l'ellisse prende tutta la finestra

noStroke(); //Cancella il bordo dell'ellisse
stroke(255,0,0); //Imposta il colore del bordo in RGB
strokeWeight(3); //Imposta lo spessore del bordo, parametro in pixel
ellipse(width/2,height/2,width,height); //In modalità CENTER l'ellisse prende tutta la finestra

stroke(0,0,255);
strokeWeight(2);
fill(0,0,255,100); //Colora la figura in RGB ed imposta la trasparenza [0-255]
ellipse(width/2,height/2,100,100);

rectMode(CENTER);
int h=100;
int l=100;
fill(255,0,0,100);
rect(width/2,height/2,l,h); //Crea un rettangolo con centro (parametro1,parametro2), parametro 3: larghezza, parametro4: altezza

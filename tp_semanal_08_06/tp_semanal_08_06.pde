import ddf.minim.*;

Minim minim;
AudioPlayer disparo, bomba, inicio, ending;

PImage fondo1, fondo4, nave, enemigo;
PFont tipo;

int posX1 = round(random(50, 300));
int posX2 = round(random(50, 300));
int posX3 = round(random(50, 300));

int enemigo1Visible = 0;
int enemigo2Visible = 0;
int enemigo3Visible = 0;

int anchoRect = 70;
int altoRect = 70;
int direccion1 = 1;
int velocidad1 = floor(random(2, 2));// 3.6 => 3, 3.1 => 3
int direccion2 = 1;
int velocidad2 = ceil(random(2, 3));// 3.6 => 4, 3.1 => 4
int direccion3 = 1;
int velocidad3 = round(random(2, 4));// 3.6 => 4, 5.2 => 5 

int posXCanon = 170;
int altoCanon = 277;
int anchoCanon = 100;
int altocanon=150;

int tamBala = 20;
int posXBala=210;
int posYBala = 200;

boolean balaSeHaDisparado = false;

int contador, pantalla, transparencia;

void setup()
{
   minim=new Minim(this);
   disparo=minim.loadFile("disparo.mp3");
   bomba=minim.loadFile("bomb.mp3");
   ending=minim.loadFile("ending.mp3");
   
  fondo1=loadImage("fondo1.jpg");
  fondo4=loadImage("fondo4.png");
  nave=loadImage("nave.png");
  enemigo=loadImage("enemigoo.gif");
  tipo=loadFont("Monospaced.bold-48.vlw");
  size(400, 400);
  //posYBala = height - altoCanon + (anchoCanon / 2);
}


void draw(){
  if(pantalla==0){
  background(200);
  image(fondo1,0,0,400,400);
  fill(0,0,0);
  textFont(tipo);
  textSize(27);
  text("DERROTA A LOS ENEMIGOS",30,100);
  text("PLAY",160,180);
  textSize(15);
  text("CONTROLES:\nFLECHA DE ARRIBA PARA DISPARAR",10,350);
  fill(#794189);
  //triangle(175,200,175,250,210,225);
  }
  
  
  ///////////////////////////////////enemigos/////////////////////////////////
  else if(pantalla==1){
    background(#30344B);
    
   if(enemigo1Visible==0){
   image(enemigo,posX1, 10, anchoRect, altoRect);
  }

  if (enemigo2Visible==0) {
    image(enemigo,posX2, 60, anchoRect, altoRect);
  }

  if (enemigo3Visible==0) {
    image(enemigo,posX3, 110, anchoRect, altoRect);
  }
    ////////////////////////////////CAÑON///////////////////////////////
  image(nave,posXCanon, altoCanon, anchoCanon, altocanon);
  }
  

//////////////////////////movimiento////////////////////////////
  // Rect 1
  if (posX1 >= width - anchoRect) {
    direccion1 = -1;
  }
  if (posX1 <= 0) {
    direccion1 = 1;
  }

  //Rect 2
  if (posX2 >= width - anchoRect) {
    direccion2 = -1;
  }
  if (posX2 <= 0) {
    direccion2 = 1;
  }

  //Rect 3
  if (posX3 >= width - anchoRect) {
    direccion3 = -1;
  }
  if (posX3 <= 0) {
    direccion3 = 1;
  }

  posX1 = posX1 + (velocidad1 * direccion1);
  posX2 = posX2 + (velocidad2 * direccion2);
  posX3 = posX3 + (velocidad3 * direccion3);
  
  //////////////////////////////////Bala/////////////////////////////
  if (balaSeHaDisparado) {
    ellipse(posXBala, posYBala, tamBala, tamBala);
    posYBala=posYBala-2;
}

//////////////////////////////////CHOQUE CON EL ENEMIGO/////////////////////////
  if (dist(posXBala, posYBala, posX1 + anchoRect/2, 0 + altoRect/2) < tamBala) {
    balaSeHaDisparado = false;
    enemigo1Visible = 1;
    bomba.isPlaying();
     bomba.play(); 
  }

  if (dist(posXBala, posYBala, posX2 + anchoRect/2, 50 + altoRect/2) < tamBala) {
    balaSeHaDisparado = false;
    enemigo2Visible = 1;
    bomba.isPlaying();
    bomba.play();
   }

  if (dist(posXBala, posYBala, posX3 + anchoRect/2, 100 + altoRect/2) < tamBala) {
    balaSeHaDisparado = false;
    enemigo3Visible = 1;
    bomba.isPlaying();
    bomba.play();
   }
  
     ////////////////////////////////GANAR///////////////////////////
     
   if(pantalla==2){
    background(300,100);
    image(fondo4,0,0,400,600);
    fill(#FFFFFF);
    textSize(20);
    text("FELICIDADES",140,150);
    text("NOS SALVASTE DEL ENEMIGO!!",60,170);
    noFill();
    //rect(150,220,90,30);
    //fill(#FFFFFF);
    //text("volver",160,240);
    ending.play();
  }
  else if((enemigo1Visible == 1) && (enemigo2Visible  == 1) && (enemigo3Visible  == 1)){
      pantalla=2;
       }
    


///controles

if (keyPressed) {
  if (keyCode == LEFT) {
    posXCanon-=5; //posXCanon = posXCanon - 5
    
  }
  if (keyCode == RIGHT) {
    posXCanon+=5; //posXCanon = posXCanon + 5
   }
  }
}


void keyPressed() {
  if (keyCode == UP) {
   balaSeHaDisparado = true;
   posXBala = posXCanon + 45;
   posYBala= altoCanon + (anchoCanon / 2);
   disparo.rewind();
   disparo.play();
  }
  if(keyCode==ENTER){
    if(pantalla==2){
      pantalla=0;
    }
  }
}

void mouseClicked() {
  if(pantalla==0){
    pantalla=1;
  } 
   if(pantalla==2){
    pantalla=0;
  }
    
  }

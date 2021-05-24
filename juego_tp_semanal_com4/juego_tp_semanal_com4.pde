PFont fuente;
int pantalla;
int score;
int numElegido;

 void setup(){
   size(400,300);
  fuente = loadFont("Monospaced.plain-48.vlw");
  textFont(fuente);
 }
 
 void draw(){
   background(0);
   fill(#3743A5);
   text("ELIGE EL NÚMERO CORRECTO", 30, 50);
   textSize(20);
   text("CLICK PARA\nCOMENZAR",200,250);
   triangle(340,250,340,270,360,260);
   numElegido=floor(random(1,9));
    //****************************INICIO*****************************//
   if(pantalla==1){
   background(0,0,0);
   textSize(25);
   rect(30,130,300,30);
   rect(30,180,300,30);
   rect(30,230,310,30);
   text("¿CUÁNTO ES\n Y=X a la 2 +2X-8?",30,40);
   fill(#DCF27A);
   text("Y=-1.(x+1)a la 2 - 6",30,150);
   text("Y=-1.(X+1)a la 2 - 9", 30,200);
   text("Y=-1.(X+1)a la 2 + 10",30,250);
   }
   
   if(pantalla==2){
    background(0,0,0);
    fill(#BC2828);
    text("INCORRECTO\nTE LLEVASTE MATEMATICAS D:",50,130);
    triangle(340,250,340,270,360,260);
   }
 if(pantalla==3){
    background(0,0,0);
    fill(#63D197);
    text("CORRECTO\nTE SACASTE UN 10 :D",80,130);
    triangle(340,250,340,270,360,260);
 }
 if(pantalla==4){
     background(0,0,0);
    fill(#BC2828);
    text("INCORRECTO\nTE LLEVASTE MATEMATICAS D:",50,130);
    triangle(340,250,340,270,360,260);
 }
 }

 void mousePressed(){
   //****************************PERDER*****************************//
 if(mouseX>30 && mouseX<width && mouseY>130 && mouseY<200){
     pantalla=2;   
   }
   //****************************GANAR*****************************//
   if(mouseX>30 && mouseX<width && mouseY>180 && mouseY<200){
     pantalla=3;
   }
   //****************************PERDER*****************************//
    if(mouseX>30 && mouseX<width && mouseY>230 && mouseY<250){
     pantalla=4;
    }
}

 
  void mouseClicked(){
    pantalla=1;
   if(mouseX>30 && mouseX<width && mouseY>130 && mouseY<200){
     pantalla=2;
   }
      if(mouseX>30 && mouseX<width && mouseY>180 && mouseY<200){
     pantalla=3;
   }
    if(mouseX>30 && mouseX<width && mouseY>230 && mouseY<250){
     pantalla=4;
    }
  }

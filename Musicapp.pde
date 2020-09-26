//Musicapp
//Trabajo Practico final de Processing
//Guillermina Charles Mengeon DNI 43034650
//Informatica Aplicada I, catedra Calcagno

Spot kick1,snare1,hh1,ride1,crash1,tom11,tom21,chancha1,drumSelect,volver,siguiente,siguiente2, partiSelect; 
Spot do1,re1,mi1,fa1,sol1,la1,si1,do2,pianoSelect;
//declaro todos los objetos de la clase spot, que son los botones

Particle[] p1 = new Particle[40]; //Declaro todos los arrays de la clase particle con los que funciona el sistema de particulas
Particle[] p2 = new Particle[40];
Particle[] p3 = new Particle[40];
Particle[] p4 = new Particle[40];
Particle[] p5 = new Particle[40];
Particle[] p6 = new Particle[40];
Particle[] p7 = new Particle[40];
Particle[] p8 = new Particle[40];

//Importo la libreria Minim
import ddf.minim.*;

//Declaro los objetos Minim y AudioSample.
Minim minim;
//Los audiosample son los distitos samples utilizados en el programa
AudioSample kick, snare, hh, ride, crash, tom1, tom2, chancha;
AudioSample c, d, e, f, g, a, b, c2;

PFont fuente,fuente2; //las fuentes
PImage bata, placa, piano, fondo, batemini; //variables PImage para las imagenes utilizadas

color resaltar, noResaltar, resaltarPiano; //Variables de color para resaltar los botones 
//booleanos utilizados en la pestaña funciones, para hacer los botones
boolean kickOver, snareOver, hhOver, crashOver, rideOver, tom1Over, tom2Over, chanchaOver = false; 
boolean drumOver, drumsOver, pianoOver, pianosOver,partiOver,partisOver, satras,siguibat,siguipia,bat=false;
boolean drumActive, pianoActive, partiActive = false;
boolean cOver, dOver, eOver, fOver, gOver, aOver, bOver, c2Over = false;


void setup() {
  //creo el objeto minim
  minim = new Minim(this);
  //Cargo los archivos de audio con loadsample para convertirlos en objetos AudioSample
  kick = minim.loadSample("kick.wav", 512);
  snare = minim.loadSample("snare.wav", 512);
  hh = minim.loadSample("hihat.wav", 512);
  ride = minim.loadSample("ride.wav", 512);
  crash = minim.loadSample("crash.wav", 512);
  tom1 = minim.loadSample("tom1.wav", 512);
  tom2 = minim.loadSample("tom2.wav", 512);
  chancha = minim.loadSample("chancha.wav", 512);
  c = minim.loadSample("do4.wav", 512);
  d = minim.loadSample("re4.wav", 512);
  e = minim.loadSample("mi4.wav", 512);
  f = minim.loadSample("fa4.wav", 512);
  g = minim.loadSample("sol4.wav", 512);
  a = minim.loadSample("la4.wav", 512);
  b = minim.loadSample("si4.wav", 512);
  c2 = minim.loadSample("do5.wav", 512);
  
  resaltar = color(255,70); //variable de color para resaltar botones
  noResaltar = color(255,0); //variable de color que no resalta botones
  resaltarPiano = color(155,70); //variable que resalta para el piano, esta dividida por los distintos colores que use de base
  fuente=loadFont("InkFree-32.vlw"); //cargo las fuentes que previamente cree
   fuente2=loadFont("fuente2.vlw");
  
  //cargo todas las imagenes
  bata = loadImage("bateria.png"); 
  placa = loadImage("placa.png");
  piano = loadImage("piano.png");
  fondo = loadImage("fondo.png");
  batemini = loadImage("bateriamini.png");
  size(1280,720); //tamaño de pantalla
  
   //construyo los objetos Spot con los parametros que correspondan  (botonX, botonY, botonSizeX, botonSizeY). 
  kick1 = new Spot(512,376,210,220); //boton de bombo
  snare1 = new Spot(730,318,160,70); //boton de redoblante
  hh1 = new Spot(975,195,60,50); //boton de hihat
  crash1 = new Spot (745,100,130,40); //boton de crash
  ride1 = new Spot (297,100,130,40); //boton de ride
  tom11 = new Spot (640,200,137,100); //boton de tom1
  tom21 = new Spot (429,200,160,100); //boton de tom2
  chancha1 = new Spot (300,310,180,200); //boton de chancha
  
  drumSelect = new Spot (415,250,430,130); //boton de seleccionar bateria en el menu de inicio
  pianoSelect = new Spot (410, 385, 435, 100); //boton de seleccionar teclado en el menu de inicio
  partiSelect = new Spot (407, 500, 450, 100); //boton de seleccionar particulas en el menu de inicio
  
  do1 = new Spot (251, 400, 78,155); //boton de Do en el teclado
  re1 = new Spot (345, 400, 78, 155); //boton de Re en el teclado
  mi1 = new Spot (441, 400, 78, 155); //boton de Mi en el teclado
  fa1 = new Spot (538, 400, 78, 155); //boton de Fa en el teclado
  sol1 = new Spot (632, 400, 78, 155); //boton de Sol en el teclado
  la1 = new Spot (729, 400, 78, 155); //boton de La en el teclado
  si1 = new Spot (825, 400, 78, 155); //boton de Si en el teclado
  do2 = new Spot (922, 400, 78, 155); //boton de Do agudo en el teclado
  
  volver = new Spot (20,20,110,60); //boton de volver al menu ("atras")
  siguiente = new Spot (1110,20,150,60); //boton de siguien para ir de bateria a teclado
  siguiente2 = new Spot (1110,640,150,60); //boton de siguiente para ir de teclado a particulas

//Inizializo cada grupo de particulas mediante su constructor y sus imputs correspondientes
for (int i = 0; i < p1.length; i++){ 
  float velX = random(-1, 1); //declaro la velocidad de la coordenada horizontal en random   
  float velY = -i; //Declaro la velocidad de la coordenada Y en funcion de Y
  p1[i] = new Particle(width/2, height/2-200, velX, velY, 250, width/2, height/2-200); //construyo cada particula mediante el constructor Particle  
  }
  for (int i = 0; i < p2.length; i++){ 
  float velX = random(-1, 1); //declaro la velocidad de la coordenada horizontal en random   
  float velY = -i; //Declaro la velocidad de la coordenada Y en funcion de Y
  p2[i] = new Particle(width/2-500, height/2-300, velX, velY, 170, width/2-500, height/2-300); //construyo cada particula mediante el constructor Particle  
  }
  for (int i = 0; i < p3.length; i++){ 
  float velX = random(-1, 1); //declaro la velocidad de la coordenada horizontal en random   
  float velY = -i; //Declaro la velocidad de la coordenada Y en funcion de Y
  p3[i] = new Particle(width/2-400, height/2-200, velX, velY, 120, width/2-400, height/2-200); //construyo cada particula mediante el constructor Particle  
  }
  for (int i = 0; i < p4.length; i++){ 
  float velX = random(-1, 1); //declaro la velocidad de la coordenada horizontal en random   
  float velY = -i; //Declaro la velocidad de la coordenada Y en funcion de Y
  p4[i] = new Particle(width/2-321, height/2-100, velX, velY, 130, width/2-100, height/2-321); //construyo cada particula mediante el constructor Particle  
  }
  for (int i = 0; i < p5.length; i++){ 
  float velX = random(-1, 1); //declaro la velocidad de la coordenada horizontal en random   
  float velY = -i; //Declaro la velocidad de la coordenada Y en funcion de Y
  p5[i] = new Particle(width/2-250, height/2-340, velX, velY, 140, width/2-250, height/2-340); //construyo cada particula mediante el constructor Particle  
  }
  for (int i = 0; i < p6.length; i++){ 
  float velX = random(-1, 1); //declaro la velocidad de la coordenada horizontal en random   
  float velY = -i; //Declaro la velocidad de la coordenada Y en funcion de Y
  p6[i] = new Particle(width/2+500, height/2-260, velX, velY, 150, width/2+500, height/2-260); //construyo cada particula mediante el constructor Particle  
  }
  for (int i = 0; i < p7.length; i++){ 
  float velX = random(-1, 1); //declaro la velocidad de la coordenada horizontal en random   
  float velY = -i; //Declaro la velocidad de la coordenada Y en funcion de Y
  p7[i] = new Particle(width/2+450, height/2-60, velX, velY, 160, width/2+450, height/2-60); //construyo cada particula mediante el constructor Particle  
  }
  for (int i = 0; i < p8.length; i++){ 
  float velX = random(-1, 1); //declaro la velocidad de la coordenada horizontal en random   
  float velY = -i; //Declaro la velocidad de la coordenada Y en funcion de Y
  p8[i] = new Particle(width/2+300, height/2-250, velX, velY, 170, width/2+300, height/2-250); //construyo cada particula mediante el constructor Particle  
  }
  
  
  }
void draw() {
  inicio(mouseX, mouseY); //funcion que activa las coordenas de mouse como valor x e y en la pantalla de inicio para los botones
  textFont(fuente2);//asigno fuente
  image(placa,0,0); //pongo imagen de fondo
  fill(255,150); //fill para el texto
  text("Musicapp es una aplicacion creada para experimentar con algunos instrumentos musicales",650,650); //Texto explicativo, datos del desarrollador/a
  text("como una bateria y un teclado, y tambien generar una experiencia visual con estos sonidos",650,665);
  text("Desarrolladora: Guillermina Charles Mengeón",940,690);
  text("Informatica Aplicada I cat. Calcagno",940,705);
textFont(fuente);//asigno fuente
noStroke(); //saco bordes de los rectangulos/botones
//Si cada uno de los determinados booleanos son true, resalto el boton para que el usuario entienda que puede clickear
    if (drumsOver) { fill(155,50); } else { fill(255,0); }
   drumSelect.boton(); //llamo a la funcion boton con el objeto Spot "drumSelect" creado mas arriba para hacer el boton (Esto se repite con el resto de los botones)
   if (pianosOver) { fill(155,50); } else { fill(255,0); }
   pianoSelect.boton();
   if (partisOver) { fill(155,50); } else { fill(255,0); }
   partiSelect.boton();
  
  if (drumActive) { //si drumActive es true, carga la pantallad de Bateria
    image(fondo,0,0); //cargo imagen
      image(bata,122,1); //cargo imagen de la bateria
      noStroke();
      drum(mouseX, mouseY); //funcion que activa las coordenas de mouse como valor x e y en la pantalla bateria para los botones
    //Si cada uno de los determinados booleanos son true, resalto el boton para que el usuario entienda que puede clickear  
      if (snareOver) { fill(resaltar); } else { fill(noResaltar); }
      snare1.boton();   //boton redoblante
      if (kickOver) { fill(resaltar); } else {  fill(noResaltar); }
      kick1.boton();    //boton bombo
      if (hhOver) { fill(resaltar); } else { fill(noResaltar); }
      hh1.boton();    //boton hihat
      if (crashOver) { fill(resaltar); } else { fill(noResaltar); }
      crash1.boton();  //boton crash
      if (rideOver) { fill(resaltar); } else { fill(noResaltar); }
      ride1.boton();  //boton ride
      if (tom1Over) { fill(resaltar); } else { fill(noResaltar); }
      tom11.boton();  //boton tom1
      if (tom2Over) { fill(resaltar); } else { fill(noResaltar); }
      tom21.boton();  //boton tom2
      if (chanchaOver) { fill(resaltar); } else { fill(noResaltar); }
      chancha1.boton(); //boton chancha

      if (satras) { fill(#56A9C1,200); } else { fill(#56A9C1); } 
     volver.boton();//boton para ir al menu
      fill(0);
      text("Menu",30,57); 
      
      if (siguibat) { fill(#56A9C1,200); } else { fill(#56A9C1); } 
     siguiente.boton();//boton para ir a la siguiente pantalla
      fill(0);
      text("Siguiente",1120,57);
  }
  
  if (pianoActive) { //si pianoActive es true, carga la pantallad de piano
    image(fondo,0,0); //cargo imagen de fondo
      image(piano,240,100); //cargo imagen del piano
      noStroke(); //saco bordes
      piano(mouseX, mouseY); //funcion que activa las coordenas de mouse como valor x e y en la pantalla bateria para los botones
      
    //Si cada uno de los determinados booleanos son true, resalto el boton para que el usuario entienda que puede clickear  
      
      if (cOver) { fill(resaltarPiano); } else { fill(noResaltar); }
      do1.boton();  //boton Do
      if (dOver) { fill(resaltarPiano); } else { fill(noResaltar); }
      re1.boton();  //boton Re    
      if (eOver) { fill(resaltarPiano); } else { fill(noResaltar); }
      mi1.boton();  //boton Mi
      if (fOver) { fill(resaltarPiano); } else { fill(noResaltar); }
      fa1.boton();  //boton Fa
      if (gOver) { fill(resaltarPiano); } else { fill(noResaltar); }
      sol1.boton();  //boton Sol
      if (aOver) { fill(resaltarPiano); } else { fill(noResaltar); }
      la1.boton();  //boton La
      if (bOver) { fill(resaltarPiano); } else { fill(noResaltar); }
      si1.boton();  //boton Si
      if (c2Over) { fill(resaltarPiano); } else { fill(noResaltar); }
      do2.boton();  //boton Do Agudo

      if (satras) { fill(#56A9C1,200); } else { fill(#56A9C1); } 
      volver.boton(); //boton para ir al menu
      stroke(0);
     fill(0);
      text("Menu",30,57);
      
      if (siguipia) { fill(#56A9C1,200); } else { fill(#56A9C1); } 
     siguiente2.boton(); //boton para ir a la siguiente pantalla
      fill(0);
      text("Siguiente",1120,676);
       
  }
  
  if (partiActive) { //si partiActive es true, carga la pantallad de Particulas
    image(fondo,0,0); //cargar imagen de fondo
    image(batemini,200,520); // cargar imagen de bateria pequeña

 for (int i = 0; i < p1.length; i++) { 
   //actualizo, muestro y regenero todas las particulas
   //dependiendo de que letra haya sido apretada, van a moverse las distintas particulas, de a grupos
  if (key == 'x' || key == 'X') p1[i].update(); p1[i].display();p1[i].regenerate();
  if (key == 'c' || key == 'C') p2[i].update(); p2[i].display();p2[i].regenerate();
  if (key == 'z' || key == 'Z') p3[i].update(); p3[i].display();p3[i].regenerate();
  if (key == 'w' || key == 'W') p4[i].update(); p4[i].display();p4[i].regenerate();
  if (key == 'a' || key == 'A') p5[i].update(); p5[i].display();p5[i].regenerate();
  if (key == 's' || key == 'S') p6[i].update(); p6[i].display();p6[i].regenerate();
  if (key == 'd' || key == 'D') p7[i].update(); p7[i].display();p7[i].regenerate();
  if (key == 'f' || key == 'F') p8[i].update(); p8[i].display();p8[i].regenerate();
 }
       
  if (satras) { fill(#56A9C1,200); } else { fill(#56A9C1); } //boton para ir al menu
      volver.boton();
      stroke(0);
     fill(0);
      text("Menu",30,57);
      
  }
  

}


void mousePressed() { 
  //trigueo todos los archivos para que cuando el booleano correspondiente a cada boton sea True
  //se inicie una nueva instancia de reproduccion de cada archivo de sonido.
  if (drumActive) { //drumActive es el booleano que hace que los sonidos de la bateria solo se reproduzcan en
                    //la pantalla de bateria
    if (kickOver) kick.trigger();
    if (snareOver) snare.trigger();
    if (hhOver) hh.trigger();
    if (crashOver) crash.trigger();
    if (rideOver) ride.trigger();
    if (tom1Over) tom1.trigger();
    if (tom2Over)tom2.trigger();
    if (chanchaOver) chancha.trigger();
  }
   if (pianoActive) { //pianoActive hace que los sonidos del piano solo se reproduzcan en la pantalla del piano
    if (cOver) c.trigger();
    if (dOver) d.trigger();
    if (eOver) e.trigger();
    if (fOver) f.trigger();
    if (gOver) g.trigger();
    if (aOver) a.trigger();
    if (bOver) b.trigger();
    if (c2Over) c2.trigger();
   
  }
}

void keyPressed() {
  //con la funcion de keyPressed trigueo los archivos con trigger para que cada vez que presiono una letra
  //se inicie una nueva instancia de reproduccion del archivo
  if (drumActive || partiActive) { //booleanos usados para que solo este disponible cuando estemos en la pantalla de bateria o particulas
    if ( key == 'c' || key == 'C') snare.trigger(); if ( key == 'x' || key == 'X') kick.trigger(); if ( key == 'z' || key == 'Z') hh.trigger();
    if ( key == 'a' || key == 'A') ride.trigger(); if ( key == 'w' || key == 'W') crash.trigger(); if ( key == 's' || key == 'S') tom1.trigger();
    if ( key == 'd' || key == 'D') tom2.trigger(); if ( key == 'f' || key == 'F') chancha.trigger();
    }

  if (pianoActive) { //booleano que activa este mecanismo solo en la pantalla teclado
    if ( key == '1' ) c.trigger(); if ( key == '2' ) d.trigger(); if ( key == '3' ) e.trigger(); if ( key == '4' ) f.trigger();
    if ( key == '5' ) g.trigger(); if ( key == '6' ) a.trigger(); if ( key == '7' ) b.trigger(); if ( key == '8' ) c2.trigger();
  }
  
}
void mouseReleased() { //con mouseRealsed hago que cuando por ej. drumOver sea verdadero y haya presionado el mouse
                       //se active drumActive, que es el que muestra la pantalla de bateria, si no lo paso por aca
                       //no terminaria de mantenerse verdadero sino que drumOver es verdadero solo cuando hago click.
                       //esto es lo mismo para cada el resto de los booleanos
  if (drumOver) { drumActive = true;}
  if (pianoOver) { pianoActive = true;}
  if (partiOver) { partiActive = true;}
  if (satras) {drumActive=false;drumOver=false;pianoActive=false;pianoOver=false;partiActive=false;partiOver=false;}
  if (siguibat) {drumActive=false;drumOver=false;pianoActive=true;pianoOver=true;}
  if (siguipia) {pianoActive=false;pianoOver=false;partiActive=true;partiOver=true;}
}   

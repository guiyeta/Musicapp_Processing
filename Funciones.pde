//en esta pestaña estan todos los botones
//todos funcionan de la misma forma, ejemplifico algunos
void inicio(int x, int y) { //funcion que habilita los botones en el menu de inicio. 
      if (boton(415,250,430,130) &&  pianoOver == false && partiOver == false) drumsOver=true; else drumsOver=false;
      if (boton(415,250,430,130) && mousePressed && pianoOver == false && partiOver == false) drumOver=true;
      //Aca drumsOver es el booleano que activa el resaltador para el boton, lo que hace que el usuario entienda que puede hacer click. 
      //si el mouse no esta sobre el area delimitada por las coordenadas, devuelve false.
      //Lo mismo para pianosOver y partisOver
      //drumOver es el booleano que al ser presionado activa el booleano drumActive que es el encargado de mostrar la pantalla 1 de "bateria" desde el menu.  
      //pianoOver es el booleano que al ser presionado activa el booleano pianoActive que es el encargado de mostrar la pantalla 2 de "piano" desde el menu.  
      //partiOver es el booleano que al ser presionado activa el booleano partiActive que es el encargado de mostrar la pantalla 3 de "particulas" desde el menu.  
      if (boton(410, 385, 435, 100)  && drumOver == false &&  pianoOver == false) pianosOver=true; else pianosOver=false;
      if (boton(410, 385, 435, 100)&& drumOver == false && mousePressed && partiOver == false ) pianoOver=true;      
      if (boton(410, 510, 435, 100)  && drumOver == false &&  pianoOver == false) partisOver=true; else partisOver=false;
      if (boton(410, 510, 435, 100)&& mousePressed  &&  pianoOver == false && drumOver == false) partiOver=true;  
      if (boton(20,20,110,60)) satras=true; else satras=false; //boton para volver al menu principal
      if (boton(1110,20,150,60)) siguibat=true; else siguibat=false; //boton para pasar de bateria a piano
      if (boton(1110,640,150,60)) siguipia=true; else siguipia=false; //boton para pasar de piano a particulas
    }
    
   //boton es el booleano que condiciona a los otros, tiene las variables x, y, width y height. Arriba en cada if le asigno los valores que los reemplazan 
  //dependiendo de que boton es. si el mouse se encuentra dentro de esas variables, devuelve verdadero, sino devuelve falso. las variables x e y son activadas
  // por las funciones "inicio", "drum" y "piano". Estas son las que habilitan que mouseX y mouseY sean valores habilitas dependiendo de en que pantalla se encuentre 
  //el usuario para que no se superpongan. 
  //de aca en mas en esta pestaña es el mismo mecanismo por cada boton
    void drum(int x, int y) {
      if ( boton(512,376,210,220) ) {
        kickOver = true; 
       snareOver = hhOver = crashOver = rideOver = tom1Over = tom2Over = chanchaOver = false;
     } else if ( boton(730,318,160,70) ) {
       snareOver = true;
       kickOver = hhOver = crashOver = rideOver = tom1Over = tom2Over = chanchaOver = false;
      } else if ( boton(975,195,60,50) ) {
      hhOver = true; 
        kickOver = snareOver = false;
     } else if ( boton(745,100,130,40) ) {
        crashOver = true; 
       kickOver = snareOver = hhOver = rideOver = tom1Over = tom2Over = chanchaOver = false;
     } else if ( boton(297,100,130,40) ) {
        rideOver = true; 
        kickOver = snareOver = hhOver = crashOver = tom1Over = tom2Over = chanchaOver = false;
     } else if ( boton(640,200,137,100) ) {
        tom1Over = true; 
        kickOver = snareOver = hhOver = crashOver = rideOver = tom2Over = chanchaOver = false;
     } else if ( boton(429,200,160,100) ) {
        tom2Over = true; 
        kickOver = snareOver = hhOver = crashOver = rideOver = tom1Over = chanchaOver = false;
     } else if ( boton(300,310,180,200) ) {
        chanchaOver = true; 
        kickOver = snareOver = hhOver = crashOver = rideOver = tom1Over = tom2Over = false;
     }  else {
        kickOver = snareOver = hhOver = crashOver = rideOver = tom1Over = tom2Over = chanchaOver = false;
      }
    }
    void piano(int x, int y) {
      if ( boton(251, 400, 78,155) ) {
        cOver = true;
        dOver = eOver = fOver = gOver =aOver = bOver =c2Over = false;
      } else if ( boton(345, 400, 78, 155) ) {
      dOver = true; 
        cOver = eOver = fOver = gOver = aOver = bOver =c2Over = false;
     } else if ( boton(441, 400, 78, 155) ) {
        eOver = true; 
        cOver = dOver = gOver = fOver = aOver = bOver = c2Over = false; 
     } else if ( boton(538, 400, 78, 155) ) {
        fOver = true; 
        cOver = dOver = eOver = gOver = aOver = bOver = c2Over = false;
     } else if ( boton(632, 400, 78, 155) ) {
        gOver = true; 
        cOver = dOver = eOver = fOver = aOver = bOver = c2Over = false;
     } else if ( boton(729, 400, 78, 155) ) {
         aOver = true; 
        cOver = dOver = eOver = fOver = gOver = bOver = c2Over = false;
     } else if ( boton(825, 400, 78, 155) ) {
        bOver = true; 
         cOver = aOver = dOver = eOver = fOver = gOver = c2Over = false;
     } else if ( boton(922, 400, 78, 155) ) {
        c2Over = true; 
        cOver = aOver = dOver = eOver = fOver = gOver =  bOver = false;
     }
     else {
        cOver =  dOver = eOver = gOver = fOver =  aOver = bOver = c2Over = false;
      }
    }   
  boolean boton(int x, int y, int width, int height )  {
      if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height ) 
    {return true; } else {  return false; }
    }

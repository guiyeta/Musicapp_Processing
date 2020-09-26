//clase que crea los rectangulos para los botones
class Spot {
  int botonX, botonY, botonSizeX, botonSizeY; //variables del rectangulo
  
  Spot(int btX, int btY,int btSizeX, int btSizeY) //constructor
  {
    botonX = btX;
    botonY = btY;
    botonSizeX = btSizeX;
    botonSizeY = btSizeY;
  }
  void boton() { //funcion que crea el rectangulo
    rect(botonX, botonY, botonSizeX, botonSizeY);
  }
  
}

    

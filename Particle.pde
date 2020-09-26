//Clase Particle utilizada para generar las particulas de la 3er pantalla

class Particle {
  
  //Campos
  float x, y; // Las coordenadas x e y de la particula
  float vx, vy; // Las velocidades en el eje x e y
  float radius; // El radio de las partículas
  float gravity = 0.3; //valor de gravedad
  float originX, originY; //el punto de origen para regenerar las particulas

  
  //definimos el constructor
  Particle(int xpos, int ypos, float velx, float vely, float r, float ox, float oy) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
    originX = ox;
    originY = oy;

  }
  
  //función que actualiza los valores
  void update() {
    vy = vy + gravity;
    
    y += vy;
    x += vx;
  }
  
  //funcion que muestra las particulas
  void display() {
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(x, y, radius, radius);
  }
  
  //funcion que regenera las particulas
  void regenerate() {
    if ((x > width+radius) || (x < -radius) || 
    //se regenera cuando pasa esos parametros, la desicion de (y > height-250) fue
    //para que que terminen en la parte de abajo del escenario y se vea el dibujo de la bateria.
        (y > height-250) || (y < -radius)) { 
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);
      vy = random(-4.0, -2.0);
    } 
  }
}

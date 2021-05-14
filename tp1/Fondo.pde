class Fondo {
  //variables locales
  float transparencia;  
  PImage fondo;

  //constructor y valores iniciales
  Fondo() {    
    fondo = loadImage("fondo2.png");
    transparencia = int (random(100));
  }

  //metodos y funciones
  void actualizar() {
    dibujar();
    calcular();
  }


  void dibujar () {    
    background(255);
    colorMode(RGB);
    noStroke();
    image(fondo, width/2, height/2);
    rect(0, 0, width, height);
    fill(200, 200, 100, transparencia);
  }

  void calcular() {
    if (programa.inter.giraDerecha) {
      transparencia +=5;
      if (transparencia > 150) { 
        transparencia = 149;
      }
      //transparencia = transparencia%255; Para ponerle un reset
    } else if (programa.inter.giraIzquierda) {
      transparencia -=5 ;
      if (transparencia < 0) { 
        transparencia = 1;
      }
    }
  }
}

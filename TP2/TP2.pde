import fisica.*;

//clases 
FWorld mundo;
FPoly poly;
Bola bola;
Cesto cesto;
Moneda moneda;

//Color fondo
color fondo = color(255);
int score;

//estados del juego
String estado;

void setup() {
  score = 0;
  size( 600, 800 );
  estado = "juego";
  
  //iniciar Fisica
  Fisica.init(this);

  iniciar();
  escenario();
}

void draw() {
  println("ESTADO: "+ estado);
  background(0);
  mundo.step();
  //translate( 300-bola.getX(), 0 ); //mueve la camara con la bola
  
  //FONDO
  fill(fondo);
  rect(0, 0, width*4, height);
  
  //PUNTAJE
  fill(0);
  text("Puntaje:" + score,10,20);
  
  mundo.draw();
  //dibujo mientras se crea la forma
  if (poly != null) {
    poly.draw(this);
  }

  //Estado ganador/perdedor
  if (estado.equals("win")) {
    fondo = color(0, 255, 0);
  } else if (estado.equals("lose")) {
    fondo = color(255, 0, 0);
  }
} 


void mousePressed() {
  dibujar();
}

void mouseReleased() {
  soltar();
}

void mouseDragged() {
  arrastrar();
}

void keyPressed() {
}

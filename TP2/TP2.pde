import fisica.*;

//clases 
FWorld mundo;
FPoly poly;
Bola bola;

//estados del juego
String estado;

void setup() {
  size( 1200, 600 );

  //iniciar Fisica
  Fisica.init(this);


  iniciar();
  escenario();
}

void draw() {
  background(0);
  mundo.step();
  /*translate( 300-bola.getX(), 0 ); //mueve la camara con la bola*/
  //fondo
  fill(255);
  rect(0, 0, width*4, height);
  mundo.draw();
  //dibujo mientras se crea la forma
  if (poly != null) {
    poly.draw(this);
  }
} 


void mousePressed() {
  dibujar();
}

void mouseReleased(){
  soltar();
}

void mouseDragged() {
  arrastrar();
}

void keyPressed() {  
}

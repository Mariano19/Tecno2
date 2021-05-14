import netP5.*;
import oscP5.*;

/*
Posibles interacciones:
 
 El fondo cambia de color cuando el mouse gira en movimiento horario y antihorario
 
 Las figuras se dibujan en el suelo y suben a la parte alta del lienzo con movimientos
 rapidos del mouse o suben hasta la mitad* con movimientos lentos (si la figura esta
 por encima, sumar y si esta por debajo restar)
 
 Las figuras se acercan entre si, si el mouse avanza hacia la izquierda
 o se alejan si es hacia la derecha
 
 Estados:
 Inactivo: Las figuras estan quietas en el suelo
 Activo: Se mueven al detectar el movimiento del mouse 
 En espera: Luego de determinado tiempo sin recibir movimiento del mouse las figuras
 vuelven al fondo 
 
 
 Ideas por hacer
 -Que la velocidad del movimiento de las figuras sea más baja cuando esten cerca del limite y el inicio, y que sea más
 rapido al medio.
 -Averiguar el punto medio entre circulo y figura especial, para hacer que ambas figuras se acerquen a ese punto y se encuentren.
 */

//---------------------------------------------------------------------------------------------------------------------------
Programa programa;
OscP5 osc;

void setup () {
  size (600, 700);
  colorMode(HSB); 
  //rectMode(CORNER);
  imageMode(CENTER);
  
  // Inicio objeto
  programa = new Programa();
  osc = new OscP5(this, 12345);
}

void draw () {
  background (0);
  programa.actualizar();
}

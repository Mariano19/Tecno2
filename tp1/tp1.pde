/*

 TECNO 2 2021- Integrantes: Mariano Quattrocchi, Isabella Pinto, Rocio Jauregui.
 Artista seleccionado: László Moholy-Nagy
 
 =================================
 Interacciones con la voz
 
 Las figuras suben en el lienzo con la amplitud del sonido captado por el microfono. 
 La velocidad en la que suben, depende de cada figura, teniendo cada una un distinto factor de amortiguación.
 
 Las figuras se acercan entre si con el pitch del sonido captado por el microfono.
 
 El fondo se torna blanco si el pitch es alto, y se pone amarillo si el pitch es bajo.
 
 =================================
 Interacciones con el mouse
 
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
 */


//=====================================================================================

import netP5.*;
import oscP5.*;
Programa programa;


void setup () {
  size (600, 700);
  colorMode(HSB); 
  imageMode(CENTER);

  // Inicio objeto
  programa = new Programa();
}

void draw () {
  background (0);
  programa.actualizar();
}


class Sonido {

  //VARIABLES   
  //====================================
  //Variables de calibración

  float maximoAmp = 105;
  float minimoAmp = 35;

  float minimoPitch = 60;
  float maximoPitch = 96;

  float f = 0.9;  

  boolean monitor = true; //True= Se muestra el monitor, False=Se oculta.

  //====================================
  
  OscP5 osc;

  float amp = 0.0;
  float pitch = 0.0;
  GestorSenial gestorAmp;
  GestorSenial gestorPitch;

  //CONSTRUCTOR
  Sonido() {        
    osc = new OscP5(this, 12345);
    gestorAmp = new GestorSenial(minimoAmp, maximoAmp);
    gestorPitch = new GestorSenial( minimoPitch, maximoPitch );
  }

  //METODOS
  void oscEvent( OscMessage m) {
    if (m.addrPattern().equals("/amp")) {
      amp = m.get(0).floatValue();
    }

    if (m.addrPattern().equals("/pitch")) {
      pitch = m.get(0).floatValue();
    }
  }
  
  void actualizar() {  
    //en cada fotograma hay que actualizar
    gestorAmp.actualizar( amp );
    gestorPitch.actualizar( pitch );

    //Dibuja el gestor si monitor es verdadero.
    if (monitor) {
      gestorAmp.imprimir( 0, 0, 100, 50 );
      gestorPitch.imprimir( 0, 60, 100, 50);
    }        
  }

}

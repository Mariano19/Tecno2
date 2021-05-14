
class Sonido {

  //VARIABLES   
  //====================================
  //Variables de calibración

  float maximoAmp = 85;
  float minimoAmp = 30;

  float minimoPitch = 60;
  float maximoPitch = 96;

  float f = 0.9;  

  boolean monitor = true; //True= Se muestra el monitor, False=Se oculta.

  //====================================
  
  OscP5 osc;

  float amp = 0.0;
  float pitch = 0.0;
  boolean huboSonido;
  boolean volPeque, volGrande;    
  float tiempoGrande, tiempoPeque;
  float [] posY;

  GestorSenial gestorAmp;
  GestorSenial gestorPitch;

  //CONSTRUCTOR
  Sonido() {        
    osc = new OscP5(this, 12345);
    gestorAmp = new GestorSenial(minimoAmp, maximoAmp);
    gestorPitch = new GestorSenial( minimoPitch, maximoPitch );
    posY= new float[5];
    
    for(int i = 0 ; i <5 ; i++){
      posY[i] = 0;
    }
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

    if (monitor) {
      gestorAmp.imprimir( 0, 0, 100, 50 );
      gestorPitch.imprimir( 0, 60, 100, 50);
    }
    
    
     //for(int i = 0 ; i <programa.circulo.cant ; i++){
     // posY[i]= map(gestorAmp.filtradoNorm(), 0, 1, height-50, 0);
     //}  
  }

}

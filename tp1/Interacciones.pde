class Interacciones {
  Dir_y_Vel mouse;

  //variables de giro
  boolean giraIzquierda, giraDerecha;  
  float direccionEnFrameAnterior;
  //variables de movimiento
  boolean movPeque, movGrande;
  float tiempoGrande, tiempoPeque;
  
  //variables swipe izq/derecha
  boolean seMovia;
  boolean izq;
  boolean der;
  boolean quieto;
  
  //variable de se mueve
  boolean seMoviaEnElFrameAnterior;
  
  Interacciones() {
    mouse = new Dir_y_Vel();
  }

  //Metodos y funciones

  void actualizar() {
    mouse.calcularTodo(mouseX, mouseY);
    velocidadMov();
    girar();
    /*swipe();*/  
    mover();
}  

  /*
  void swipe(){
    boolean seMueve=false;
    float sensibilidad = 35;
    if(mouse.velocidad()>sensibilidad && mouse.velocidad()<150){
      seMueve = true;
    }
    
    der = false;
    izq = false;
    
    if(seMueve && !seMovia){
      der = mouse.direccionX()>sensibilidad?true:false;      
      izq = mouse.direccionX()<sensibilidad?true:false;
    }
    seMovia = seMueve;
  }
  
  void noMovimiento(){
    quieto = false;
    
    float sensibilidad = 1;
    if(mouse.velocidad()>=sensibilidad){
      quieto=false;
    }else{
      quieto=true;
    }
  }*/
  
  
  //SE MUEVE
  void mover(){
     mouse.calcularTodo(mouseX, mouseY);
    //----- que pasa con el mouse en este frame
    boolean seMueveElmouseEnEsteFrame = false;
    float sensibilidad = 35;
    if (mouse.velocidad()>sensibilidad && mouse.velocidad()<150) {
      seMueveElmouseEnEsteFrame = true;
    }
    seMoviaEnElFrameAnterior = seMueveElmouseEnEsteFrame;    
  }
  
    
  
  //INTERACCION GIRO HORARIO 
  void girar() { 
    giraIzquierda = false;
    giraDerecha = false;
    if (mouse.velocidad()>10) {
      float diff = mouse.direccionPolar()-direccionEnFrameAnterior;
      if (diff<0) {
        giraIzquierda = true;
      } else {
        giraDerecha = true;
      }
    }
    direccionEnFrameAnterior =  mouse.direccionPolar();
  }

  //INTERACCION MOVIMIENTOS RAPIDOS Y DESPACIOS
  void velocidadMov() {
    movGrande = false;
    movPeque = false;
    tiempoGrande--;
    tiempoPeque--;
    tiempoGrande = constrain(tiempoGrande, 0, 90);
    tiempoPeque = constrain(tiempoPeque, 0, 90);
    //println(tiempoPeque, tiempoGrande);
    if (mouse.velocidad()>10) {
      float umbral = 40;
      if (mouse.velocidad()>umbral) {
        tiempoGrande+=10;
        tiempoPeque-=10;
      } else {
        if (tiempoGrande<10) {
          tiempoPeque+=10;
        }
      }
    }

    if (tiempoGrande>55) {
      movGrande = true;
    } 
    if (tiempoPeque>55) {
      movPeque = true;
    }
  }
}

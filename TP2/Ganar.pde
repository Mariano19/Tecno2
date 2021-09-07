class Ganar {

  Ganar() {
  }

  void pantalla() {
    pushStyle();
    fondo = color(0, 255, 0);
    //fill(fondo);
    //rect(0, 0, width*4, height);    
    image(ganaste, 0, 0);
    textSize(40);    
    fill(0);
    
    textFont(kinder);
    text("Puntaje:" + score, width/2, height/2 + 20);

    popStyle();
  }
}

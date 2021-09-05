class Perder {

  Perder() {
  }

  void pantalla() {
    pushStyle();
    fondo = color(255, 0, 0);
    image(perdiste, 0, 0);
    fill(0);
    textSize(40);
    textFont(kinder);
    text("Puntaje:" + score, width/2, height/2 + 20);
    popStyle();
  }
}

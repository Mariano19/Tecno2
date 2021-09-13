class Perder {
  float posXCursor;
  float posYCursor;
  color c;
  float opacidad = 100;
  float sizeCirculo = 80;

  Perder() {
    c = color(255, 150);
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

    pushStyle();
    fill(0);
    textFont(kinder);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Posiciona el cursor aca para volver a jugar", width/2, height-50);
    popStyle();

    pushStyle();
    noStroke();
    fill(c);
    ellipse(width/2, height-120, sizeCirculo, sizeCirculo);
    popStyle();

    pushStyle();
    stroke(0);
    strokeWeight(2);
    noFill();
    dash.ellipse(width/2, height-120, 100, 100);
    popStyle();

    if (camara.available()) {
      camara.read();
      opencv.loadImage( camara );
      opencv.threshold(umbral);
      PImage salida = opencv.getOutput();

      posXCursor = width/3-80;
      posYCursor = height/2-70;

      pushStyle();
      blendMode(ADD); 
      image(salida, 0+posXCursor, 0+posYCursor);
      PVector pixelMasBrillante = opencv.max();
      popStyle();

      pushStyle();
      imageMode(CORNER);
      image(cursor, pixelMasBrillante.x+posXCursor, pixelMasBrillante.y+posYCursor);
      popStyle();
    }
  }

  void boton() {
    PVector pixelMasBrillante = opencv.max();

    if (pixelMasBrillante.x+posXCursor > width/2-50 && pixelMasBrillante.x+posXCursor < width/2+50 && pixelMasBrillante.y+posYCursor > height-120-50 && pixelMasBrillante.y+posYCursor < height-120+50) {
      //estado="juego";
      opacidad+=2;
      sizeCirculo--;
      if (sizeCirculo<60) {
        sizeCirculo=60;
      }
      if (opacidad>220) {
        opacidad = 220;
        estado="juego";
      }
      c = color(255, opacidad);
    } else {
      opacidad = 100;
      sizeCirculo++;
      if (sizeCirculo>80) {
        sizeCirculo=80;
      }
      c = color(255, opacidad);
    }
  }
}

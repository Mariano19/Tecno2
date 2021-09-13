class Portada {
  int currentFrame = 0;
  float posXCursor;
  float posYCursor;
  color c;
  float opacidad = 100;
  float sizeCirculo = 80;

  PImage[] portada = new PImage[16];

  Portada() {
    c = color(255, 150);
    for (int i=0; i<16; i++) {
      portada[i]=loadImage("portada"+i+".gif");
    }
  }

  void dibujar() {
    if (estado.equals("portada")) {

      //ANIMACIÓN DEL FONDO
      currentFrame = (currentFrame+1) % 16;  // Use % to cycle through frames
      int offset = 0;
      for (int x = -100; x < width; x += portada[0].width) { 
        image(portada[(currentFrame+offset) % 16], 0, 0);
        offset+=2;
        image(portada[(currentFrame+offset) % 16], 0, 0);
        offset+=2;
        //====================
        pushStyle();
        fill(0);
        textFont(kinder);
        textSize(30);
        textAlign(CENTER, CENTER);
        text("Posiciona el cursor aca para jugar", width/2, height-50);
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
    }
  }

  void boton() {
    PVector pixelMasBrillante = opencv.max();

    if (pixelMasBrillante.x+posXCursor > width/2-50 && pixelMasBrillante.x+posXCursor < width/2+50 && pixelMasBrillante.y+posYCursor > height-120-50 && pixelMasBrillante.y+posYCursor < height-120+50) {
      //estado="juego";
      opacidad+=2;
       sizeCirculo--;
       if(sizeCirculo<60){
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
      if(sizeCirculo>80){
       sizeCirculo=80;
       }
      c = color(255, opacidad);
    }
  }

  void jugar() {
  }
}

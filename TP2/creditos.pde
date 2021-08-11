class Creditos {
  int currentFrame = 0;

  PImage back, backdark;
  PImage[] creditos = new PImage[16];

  Creditos() {
    back = loadImage("back.png");
    backdark = loadImage("backdark.png");
    for (int i=0; i<16; i++) {
      creditos[i]=loadImage("creditos"+i+".gif");
    }
  }

  void dibujar() {
    if (estado.equals("creditos")) {

      //ANIMACIÓN DEL FONDO
      currentFrame = (currentFrame+1) % 16;  // Use % to cycle through frames
      int offset = 0;
      for (int x = -100; x < width; x += creditos[0].width) { 
        image(creditos[(currentFrame+offset) % 16], 0, 0);
        offset+=2;
        image(creditos[(currentFrame+offset) % 16], 0, 0);
        offset+=2;

        //Flecha
        image(back, 50, 50);

        if (mouseX>50 && mouseX<50+80 && mouseY > 50 && mouseY < 50+60) {
          image(backdark, 50, 50);
        }

        //CURSOR
        pushStyle();
        imageMode(CORNER);
        image(cursor, mouseX, mouseY);
        popStyle();
      }
    }
  }

  void volver() {
    if (mouseX>50 && mouseX<50+80 && mouseY > 50 && mouseY < 50+60) {
      estado = "portada";
    }
  }
}

class Instr {
  PImage instruccionesgr;
  PImage back, backdark;

  Instr() {
    instruccionesgr = loadImage("instruccionesgrande.png");
    back = loadImage("back.png");
    backdark = loadImage("backdark.png");
  }

  void dibujar() {

    if (estado.equals("instrucciones")) {
      image(instruccionesgr, 0, 0);
      image(back, 50, 50);

      if (mouseX>50 && mouseX<50+80 && mouseY > 50 && mouseY < 50+60) {
        image(backdark, 50, 50);
      }

      pushStyle();
      imageMode(CORNER);
      image(cursor, mouseX, mouseY);
      popStyle();
    }
  }
  
    void volver() {
    if (mouseX>50 && mouseX<50+80 && mouseY > 50 && mouseY < 50+60) {
      estado = "portada";
    }
  }
}

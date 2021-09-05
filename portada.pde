class Portada {
  int currentFrame = 0;

 
  PImage[] portada = new PImage[16];

  Portada() {
    
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
        color boton = color(0);
        color boton2 = color(0);
        color boton3 = color(0);

        if (mouseX>80 && mouseX<80+110 && mouseY > height/2+70 && mouseY < height/2+70+35) {
          boton = color(255, 0, 0);
          blob.play();      
          blob.unmute();
        }
        else if (mouseX>80 && mouseX<80+270 && mouseY > height/2+150 && mouseY < height/2+150+35) {
          boton2 = color(255, 0, 0);
          blob.play();      
          blob.unmute();
        }
        else if (mouseX>80 && mouseX<80+170 && mouseY > height/2+230 && mouseY < height/2+230+35) {
          boton3 = color(255, 0, 0);
          blob.play();    
          blob.unmute();
        }else{
          blob.rewind();
          blob.mute();
        }

        //BOTONES
        pushStyle();
        fill(boton);
        textFont(kinder);
        textSize(40);
        textAlign(LEFT);
        text("JUGAR", 80, height/2+100);
        fill(boton2);
        text("INSTRUCCIONES", 80, height/2+180);
        fill(boton3);
        text("CREDITOS", 80, height/2+260);
        popStyle();

        //CURSOR
        pushStyle();
        imageMode(CORNER);
        image(cursor, mouseX, mouseY);
        popStyle();
      }
    }
  }

  void jugar() {
    
    if (mouseX>80 && mouseX<80+110 && mouseY > height/2+70 && mouseY < height/2+70+35) {
      estado = "juego";
    }
    if (mouseX>80 && mouseX<80+170 && mouseY > height/2+230 && mouseY < height/2+230+35) {
      estado = "creditos";
    }
    if (mouseX>80 && mouseX<80+270 && mouseY > height/2+150 && mouseY < height/2+150+35) {
      estado = "instrucciones";
    }
  }
}

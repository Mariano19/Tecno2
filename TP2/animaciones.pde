class Animaciones{
  
  int numFrames = 12;  // The number of frames in the animation
  int currentFrame = 0;
  PImage[] imagesagua = new PImage[numFrames];
  PImage[] imagesarbol = new PImage[numFrames];
  int posX, posY;
  
  int previousDisplayTime;  // Keep track of the last time a frame of the animation was displayed
  int deltaTime;            // The time between each frame
  
  Animaciones() {
    
  
    deltaTime = 300;//150
    previousDisplayTime = 0;
    
    posX = 1400;
    posY = 910;
    
          
    for (int i=0; i<9; i++) {
      imagesagua[i]=loadImage("animacion/agua"+i+".png");
      //imagesarbol[i]=loadImage("animacion/arbol"+i+".png");
    }
        
    imagesarbol[0]  = loadImage("animacion/arbol0.png");
    imagesarbol[1]  = loadImage("animacion/arbol1.png");
    imagesarbol[2]  = loadImage("animacion/arbol2.png");
    imagesarbol[3]  = loadImage("animacion/arbol3.png");  
    
    /*
    images[4]  = loadImage("agua2/agua4.png");
    images[5]  = loadImage("agua2/agua5.png");
    images[6]  = loadImage("agua2/agua6.png");
    /*images[0]  = loadImage("agua3/agua00.png");
    images[1]  = loadImage("agua3/agua01.png");
    images[2]  = loadImage("agua3/agua02.png");
    images[3]  = loadImage("agua3/agua03.png");
    images[4]  = loadImage("agua3/agua04.png");
    /*images[5]  = loadImage("agua3/agua05.png");
    /*images[6]  = loadImage("agua3/agua06.png"); 
    images[7]  = loadImage("agua3/agua07.png");
    images[8]  = loadImage("agua3/agua08.png");
    images[9]  = loadImage("agua3/agua09.png"); 
    images[10]  = loadImage("agua3/agua10.png");
    images[11]  = loadImage("agua3/agua11.png");*/
  }
  
  void dibujar() {
    if (millis() > previousDisplayTime + deltaTime) {
      currentFrame++;
      if (currentFrame > 2) { 
        currentFrame = 0;
        
      }
      previousDisplayTime = millis();
    }   
    
    //AGUA
    image(imagesagua[currentFrame], posX, posY);
    image(imagesagua[currentFrame+1], posX+400, posY);
    image(imagesagua[currentFrame+1], posX+1700, posY-50);
    image(imagesagua[currentFrame+1], posX+2100, posY-50);
    //println(images[currentFrame]);
    //ARBOL
    image(imagesarbol[currentFrame], 2500, 415);
  } 
}

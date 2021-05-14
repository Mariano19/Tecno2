class Triangulos {
  //Variables
  //Limite inferior del canvas y punto de inicio en Y
  float limite_inferior = height-100;
  float posY = limite_inferior;

  //Limite superior del canvas y punto de inicio en X 
  float limite_superior=random(height/2-70, height/2+70);
  float posX_inicial = random(10, width-100);
  float posX = posX_inicial;    

  boolean shake=false; 
  int cant = 2;
  int num2 = int(random(cant));       //seleccion al azar del elemento
  PImage[] imgtriangulos=new PImage[cant];

  
  //Constructor
  Triangulos() {    
    for (int i=0; i<cant; i++) {
      imgtriangulos[i]=loadImage("triangulo"+i+".png");
    }
  }
  //Metodos
  void actualizar(){
  dibujar();
  movimiento();
  shaking();
  }
  
  void dibujar() {
    image(imgtriangulos[num2], posX, posY);
  }
  
  void movimiento() {
    if (programa.inter.movGrande) {     
      //Si el circulo llega al limite de Y, se queda quieto y comienza a temblar.
      if (posY <= limite_superior) {
        posY=limite_superior;
        shake = true;
      } else {
        posY-=1;
        shake = false;
      }
    } else if (programa.inter.seMoviaEnElFrameAnterior == false) {// cambio variable movPeque
      if(posY>=limite_inferior){
        posY = limite_inferior;      
      }else{
      posY ++;
      shake = false;
    }}
  }

  void shaking() {
    if (shake) {
      posX=random(posX-1, posX+1);
    } else {
      posX=posX_inicial;
    }
  }

}

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
  
  float [] f;
  float factor;
  float [] posy;
  float [] px;
  float [] py;
  float [] posx;
  float [] posyDestino;
  float [] posyInicial;
  
  int selector;

  
  //Constructor
  Triangulos() {    
    selector = int(random(0,1.9));
    f = new float [cant];
    posy = new float [cant];
    px= new float [cant];
    py= new float [cant];
    posx= new float [cant];
    posyDestino= new float [cant];
    posyInicial = new float [cant];
    
    for (int i=0; i<cant; i++) {
      imgtriangulos[i]=loadImage("triangulo"+i+".png");
      f[i] = random(0.1, 1);
      posy[i] =height-50;
      posx[i] =random(50,width-10);
      posyDestino[i] =random(10,250);
      posyInicial [i] = height-50;
      
    }
  }
  //Metodos
  void actualizar(){
  dibujar();
  movimiento();
  //shaking();
  }
  
  void dibujar() {
     
      image(imgtriangulos[selector], px[0], py[0]);
    
  }
  
      void movimiento() {     
    //factor = map(mouseX, 0, width, -1, 1);
    factor = map(programa.sonido.pitch,0,width,-1,1);

    for (int i = 0; i <cant; i++) {
      posy[i]= map(programa.sonido.gestorAmp.filtradoNorm(), 0, 1, height, 0);
      
    }

    for (int i=0; i<cant; i++) {
      px[i] = lerp(posx[i], programa.promedioPosX,f[i]);
      py[i] = lerp(posyInicial[i], programa.promedioPosY,f[i]);
    }
  }

//  void shaking() {
//    if (shake) {
//      posX=random(posX-1, posX+1);
//    } else {
//      posX=posX_inicial;
//    }
//  }

}

class FigEspeciales {  

  //variables locales
  int cant2 = 3; //CANTIDAD DE ELEMENTOS MOSTRADOS
  float limite_inferior = height;  
  float limite;  
  boolean shake;
  int cant = 3;
  PImage[] especiales = new PImage[cant];

  PImage[] especialesborde = new PImage[cant];
  int num2 = int(random(cant));              //seleccion al azar del elemento  

  //variables de movimiento
  //float yinicio;
  float [] posx;
  float [] x_destino;
  float [] posy;
  float [] posyInicial;
  float [] posyDestino;
  float[] avance;
  float[] vel;
  float dondex;
  float [] f;
  // Variables acercar
  float [] px = new float[cant];
  float [] py = new float[cant];
  float sumX = 0;
  float sumY = 0;
  float promedioPosX;
  float promedioPosY;
  float factor;
  int selector;


  //constructor y valores iniciales
  FigEspeciales() {  
    posx= new float[cant];
    x_destino= new float[cant];
    posy= new float[cant];
    posyInicial= new float[cant];
    posyDestino= new float[cant];
    avance= new float[cant];
    vel= new float[cant];
    f = new float [cant];
    dondex=random(20, width-20);
    shake = false;
    selector = int(random(0,2.9));

    //limite_superior = random(height/2-70, height/2+70);
    //imagen
    for ( int i = 0; i < cant; i++ ) {
      especiales [i] = loadImage( "especial"+ i + ".png" );

      especialesborde [i] = loadImage( "especial"+ i + "-1.png" );
      x_destino[i]=dondex;
      posx [i] = random(150, 400);
      posy [i] = height-500;
      posyInicial [i] = height;
      posyDestino [i] = random(10, 250);
      avance [i] = 0;
      vel [i] = random(0.002, 0.007);
      f[i] = random(0.1, 1);
    }
  }

  void actualizar() {
    dibujar();
    //shaking();
    movimiento();
    limites();
    //debug();
  }
  //metodos y funciones
  void dibujar () {     //dibuja uno solo
    image(especialesborde[selector], px[1], py[1]);
    pushStyle();
    blendMode(LIGHTEST);
    image(especiales[selector], px[1], py[1]);
    popStyle();
    //Para que aparezcan más
    //for(int i = 0 ; i <cant ; i++){
    //  image(especiales[i], posX, posY);
    //  }
  }  

  //=======MOVIMIENTO CON SONIDO=============
  void movimiento() {     
    factor = map(programa.sonido.pitch, 0, width, -1, 1);

    for (int i = 0; i <cant; i++) {
      posy[i]= map(programa.sonido.gestorAmp.filtradoNorm(), 0, 1, height, 0);
    }

    for (int i=0; i<cant; i++) {
      px[i] = lerp(posx[i], programa.promedioPosX, f[i]);
      py[i] = lerp(posyInicial[i], programa.promedioPosY, f[i]);
    }
  }

  //=======MOVIMIENTO CON MOUSE=============
  /*
  void movimiento() {
    pushStyle();
    for (int i=0; i<cant; i++) {
      //println(programa.inter.seMoviaEnElFrameAnterior);
      if (programa.inter.movGrande) { 
        //println( posy[i]);
        if (avance [i]<1) {
          avance[i] = avance[i]+vel[i];
        }
        posy[i] = lerp(posyInicial[i], posyDestino[i], avance[i]);

        //shake   
        if (posy[i]-height/6 <= posyDestino[i]) {
          //posY=limite_superior;
          shake = true;
        } else {

          shake = false;
        }
      } else if (programa.inter.seMoviaEnElFrameAnterior == false) {// cambio variable movPeque
        //println( posyInicial[i]);
        if (avance [i]<2) {
          avance[i] = avance[i]-vel[i];
          shake = false;
        }  

        posy[i] = lerp(posyInicial[i], posyDestino[i], avance[i]);
        //posyInicial[i] = lerp(posyInicial[i], posyDestino[i], avance[i]);
      }      
      //println(sumX,sumY);
    }
    factor = map(mouseX, 0, width, -1, 1);

    for (int i=0; i<cant; i++) {
      //println(factor);
      px[i] = lerp(posx[i], programa.promedioPosX, factor);
      py[i] = lerp(posy[i], programa.promedioPosY, factor);
    }
    //image(circulos[i], px, py);
    popStyle();
  }
  */



  void limites() {
    for (int i=0; i<cant; i++) {
      if (posy[i] >= limite_inferior) {
        posy[i] = limite_inferior;
      }
      if (avance[i] < 0 ) {
        avance[i] = 0.01;
      }
    }
  }

  //void shaking() {
  //  for (int i=0; i<cant; i++) {
  //    if (shake) {
  //      posx[i]=random(posx[i]-1, posx[i]+1);
  //    } else {
  //      // posX=posX_inicial;
  //    }
  //  }
  //}
}

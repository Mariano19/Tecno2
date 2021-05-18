class Circulos {
  //=== DEBUG ===//
  //True=se muestra, false=no se muestra
  boolean debug = false;

  //variables locales  
  int cant2 = 3; //CANTIDAD DE ELEMENTOS MOSTRADOS
  float limite_inferior = height-50;
  boolean shake;
  float limite;
  int cant = 5;
  PImage[] circulos = new PImage[cant];
  int num2 = int(random(cant)); //seleccion al azar del elemento

  //variables de movimiento
  float yinicio;
  float [] posx;
  float [] x_destino;
  float [] posy;
  float [] posyInicial;
  float [] posyDestino;
  float[] avance;
  float[] vel;
  float dondex;

  // Variables acercar
  float [] px = new float[cant];
  float [] py = new float[cant];
  float sumX = 0;
  float sumY = 0;
  float promedioPosX;
  float promedioPosY;  

  //Factores
  float factor;
  float [] f;

  //Seleccion de imagen
  int selector1;
  int selector2;


  //constructor y valores iniciales
  Circulos() { 
    posx= new float[cant];
    x_destino= new float[cant];
    posy= new float[cant];
    posyInicial= new float[cant];
    posyDestino= new float[cant];
    avance= new float[cant];
    vel= new float[cant];
    f = new float [cant];
     selector1 = int(random(0, 1.9));
      selector2 = int(random(2, 4));

    //asigno valores a todos
    for ( int i = 0; i < cant; i++ ) {
      circulos [i] = loadImage( "circulo"+ i + ".png" );
      //posx [i] = map(i, 0, cant, 100, 500);
      shake = false;
      x_destino[i]=dondex;
      posx [i] = random(50, width-100);
      posy [i] = height-50;
      posyInicial [i] = height-50;
      posyDestino [i] = random(10, 250);
     
      dondex=random(20, width-20);
      f[i] = random(0.4, 0.95);
      //avance [i] = 0;
      //vel [i] = random(0.002, 0.007);
    }

    //Resize de las imagenes    
    circulos[0].resize(170, 170);
    circulos[1].resize(170, 170);
    circulos[2].resize(80, 80);
    circulos[3].resize(80, 80);
  }

  //Funciones
  void actualizar() {
    dibujar();    
    movimiento();
    limites();
    debug();
  }  

  void dibujar () {
    image(circulos[selector1], px[1], py[1]);
    image(circulos[selector2], px[2], py[2]);

    /*for (int i=0; i<cant; i++) {      
     image(circulos[i], px[i], py[i]);
     }*/
  }

  //====MOVIMIENTO CON SONIDO====
  void movimiento() {     
    factor = map(programa.sonido.pitch, 0, width, -1, 1);

    for (int i = 0; i <cant; i++) {
      posy[i]= map(programa.sonido.gestorAmp.filtradoNorm(), 0, 1, height, 0);
      posx[i]= map(programa.sonido.gestorPitch.filtradoNorm(), -1, 1, height, 0);
    }
    println(programa.sonido.gestorAmp.filtradoNorm());
    println(programa.sonido.gestorPitch.filtradoNorm());

    for (int i=0; i<cant; i++) {
      px[i] = lerp(posx[i], programa.promedioPosX, f[i]);
      py[i] = lerp(posyInicial[i], programa.promedioPosY, f[i]);
      //posyDestino[i] * (1-f[i])+ posy[i] * f[i];
    }
  }
  //==========================

  //====MOVIMIENTO CON MOUSE====
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
        //if (posy[i]-height/6 <= posyDestino[i]) {
        //  //posY=limite_superior;
        //  shake = true;
        //} else {
        //  shake = false;
        //seMoviaEnElFrameAnterior}
      } else if (programa.inter.seMoviaEnElFrameAnterior == false) {// cambio variable movPeque
        //println( posyInicial[i]);
        if (avance [i]<2) {
          avance[i] = avance[i]-vel[i];
          //shake = false;
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

  //==========================

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

  //  void shaking() {
  //    for (int i=0; i<cant; i++) {
  //      if (shake) {
  //        posx[i]=random(posx[i]-1, posx[i]+1);
  //      } else {
  //        // posX=posX_inicial;
  //      }
  //    }
  //  }

  void debug() {
    if (debug) {
      pushStyle();
      fill(255, 0, 0);
      textSize(24);
      text("POSY " + posy[1], width-200, 50);
      text("F " +f[1], width-200, 80);
      text("DESTY " + posyDestino[1], width-200, 110);
      text("POSX " + posx[1], width-200, 140);
      text("PX " + px[1], width-200, 170);
      text("PY " + py[1], width-200, 200);

      popStyle();
    }
  }
}

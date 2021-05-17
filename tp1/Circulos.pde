class Circulos {
  //variables locales
  int cant2 = 3; //CANTIDAD DE ELEMENTOS MOSTRADOS
  float limite_inferior = height;
  boolean shake;
  float limite;
  int cant = 5;
  PImage[] circulos = new PImage[cant];
  int num2 = int(random(cant));       //seleccion al azar del elemento

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
  float factor;
  float [] f;



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
      dondex=random(20, width-20);

    shake = false;
    //limite = random(height/2-70, height/2+70);   




    //asigno valores a todos
    for ( int i = 0; i < cant; i++ ) {
      circulos [i] = loadImage( "circulo"+ i + ".png" );
      //posx [i] = map(i, 0, cant, 100, 500);
      x_destino[i]=dondex;
      posx [i] = random(50, width-100);
      posy [i] = height-50;
      posyInicial [i] = height-50;
      posyDestino [i] = random(10, 250);
      avance [i] = 0;
      vel [i] = random(0.002, 0.007);

      f[i] = random(0.4, 0.95);
    }

    circulos[1].resize(150, 150);
    circulos[0].resize(170, 170);
    circulos[2].resize(80, 80);
    circulos[3].resize(50, 50);
  }

  //Funciones

  void actualizar() {
    dibujar();
    //shaking();
    movimiento();
    limites();
    //debug();
    //calcular();
  }  

  void dibujar () {  //dibuja 
    for (int i=0; i<cant; i++) {      
      image(circulos[i], px[i], py[i]);
    }
  }

  //====MOVIMIENTO CON SONIDO====
  void movimiento() {     
    //factor = map(mouseX, 0, width, -1, 1);
    factor = map(mouseX,0,width,-1,1);

    for (int i = 0; i <cant; i++) {
      posy[i]= map(programa.sonido.gestorAmp.filtradoNorm(), 0, 1, height, 0);
      
    }

    for (int i=0; i<cant; i++) {
      px[i] = lerp(posx[i], programa.promedioPosX, factor);
      py[i] = posyDestino[i] * (1-f[i])+ posy[i] * f[i];
    }
  }
  //==========================


  //====MOVIMIENTO CON MOUSE====
  //void movimiento() {
  //  pushStyle();
  //  for (int i=0; i<cant; i++) {
  //    //println(programa.inter.seMoviaEnElFrameAnterior);
  //    if (programa.inter.movGrande) { 
  //      //println( posy[i]);
  //      if (avance [i]<1) {
  //        avance[i] = avance[i]+vel[i];
  //      }
  //      posy[i] = lerp(posyInicial[i], posyDestino[i], avance[i]);

  //      //shake   
  //      //if (posy[i]-height/6 <= posyDestino[i]) {
  //      //  //posY=limite_superior;
  //      //  shake = true;
  //      //} else {
  //      //  shake = false;
  //      //seMoviaEnElFrameAnterior}
  //    } else if (programa.inter.seMoviaEnElFrameAnterior == false) {// cambio variable movPeque
  //      //println( posyInicial[i]);
  //      if (avance [i]<2) {
  //        avance[i] = avance[i]-vel[i];
  //        //shake = false;
  //      }  

  //      posy[i] = lerp(posyInicial[i], posyDestino[i], avance[i]);
  //      //posyInicial[i] = lerp(posyInicial[i], posyDestino[i], avance[i]);
  //    }      
  //    //println(sumX,sumY);
  //  }
  //  factor = map(mouseX, 0, width, -1, 1);

  //   for (int i=0; i<cant; i++) {
  //    //println(factor);
  //    px[i] = lerp(posx[i], programa.promedioPosX, factor);
  //    py[i] = lerp(posy[i], programa.promedioPosY, factor);

  //   }
  //  //image(circulos[i], px, py);
  //  popStyle();
  //}

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

  /*void debug() {
   pushStyle();
   fill(255, 0, 0);
   textSize(24);
   text("POSY " + posy[1], 50, 50);
   text("AVANCE " +avance[1], 50, 80);
   text("VEL " + vel[1], 50, 110);
   text("POSX " + posx[1], 50, 140);
   //text("PX " + px, 50, 170);
   
   popStyle();
   }*/
}

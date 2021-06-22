class Lineas {
  //variables locales
  int cant2 = 3; //CANTIDAD DE ELEMENTOS MOSTRADOS
  float limite_inferior = height-100;
  boolean shake;
  float limite;
  int cant = 3;
  PImage[] lineas = new PImage[cant];
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
  float [] f;
  float r1=0;
  float r2=0;
  float a = 0;
  // Variables acercar
  float [] px = new float[cant];
  float [] py = new float[cant];
  float sumX = 0;
  float sumY = 0;
  float promedioPosX;
  float promedioPosY;
  float factor;
  //Seleccion de imagen
  int selector1;
  int selector2;



  //constructor y valores iniciales
  Lineas() {  
    posx= new float[cant];

    x_destino= new float[cant];
    posy= new float[cant];
    posyInicial= new float[cant];
    posyDestino= new float[cant];
    avance= new float[cant];
    vel= new float[cant];
    dondex=random(20, width-20);
    f = new float [cant];
    shake = false;
    limite = random(height/2-70, height/2+70);  
    selector1 = int(random(0, 2.9));
    selector2 = int(random(0, 2.9));

    //Para que nunca se dibuje la misma linea dos veces
    if (selector1==selector2 && selector2>0) {
      selector2-=1;
    } else if (selector1==selector2 && selector2==0) {
      selector2+=1;
    }


    //asigno valores a todos
    for ( int i = 0; i < cant; i++ ) {
      lineas [i] = loadImage( "linea"+ i + ".png" );
      //posx [i] = map(i, 0, cant, 100, 500);
      x_destino[i]=dondex;
      posx [i] = random(50, width-100);
      posy [i] = height-50;
      posyInicial [i] = height-50;
      posyDestino [i] = random(10, 250);
      avance [i] = 0;
      vel [i] = random(0.002, 0.007);
      f[i] = random(0.1, 1);
    }
  }

  //Funciones
  void actualizar() {
    dibujar();
    shaking();
    movimiento();
    limites();
    rotacion();
    //debug();
    //calcular();
  }  

  void dibujar () {  //dibuja 

    pushMatrix();
    translate(px[0], py[0]);
    rotate(r1);
    image(lineas[selector1], 0, 0);
    popMatrix();
    pushMatrix();
    translate(px[1], py[1]);
    rotate(r2);
    image(lineas[selector2], 0, 0);
    popMatrix();


    //for (int i=0; i<cant; i++) {      
    //  image(lineas[i], px[i], py[i]);
    //}
  }
  //====MOVIMIENTO CON SONIDO====
  void movimiento() {     
    //factor = map(programa.sonido.pitch, 0, width, -1, 1);
    factor = map(programa.sonido.gestorPitch.filtradoNorm(), 0, 1, 0, 1 );

    for (int i = 0; i <cant; i++) {
      posy[i]= map(programa.sonido.gestorAmp.filtradoNorm(), 0, 1, height, 0);
      //posx[i]= map(programa.sonido.gestorPitch.filtradoNorm(), -1, 1, height, 0);
    }
    //println(programa.sonido.gestorAmp.filtradoNorm());
    //println(programa.sonido.gestorPitch.filtradoNorm());
    println(programa.sonido.gestorPitch.filtradoNorm());
    println(programa.promedioPosX);

    for (int i=0; i<cant; i++) {
      px[i] = lerp(posx[i], programa.promedioPosX, factor);
      py[i] = lerp(posyInicial[i], programa.promedioPosY, f[i]);
      //posyDestino[i] * (1-f[i])+ posy[i] * f[i];
    }
  }

  void rotacion() {
    float a = 90;
    float b = 90;
    
    a = map(programa.sonido.gestorAmp.filtradoNorm(), 0, 1, 90, 0);
    b = map(programa.sonido.gestorAmp.filtradoNorm(), 0, 1, 90, 180);
    
    r1 = radians(a);
    r2 = radians(b);
  }

  /*
  void movimiento() {     
   //factor = map(mouseX, 0, width, -1, 1);
   factor = map(programa.sonido.pitch, 0, width, -1, 1);
   
   for (int i = 0; i <cant; i++) {
   posy[i]= map(programa.sonido.gestorAmp.filtradoNorm(), 0, 1, height, 0);
   }
   
   for (int i=0; i<cant; i++) {
   px[i] = lerp(posx[i], programa.promedioPosX, f[i]);
   py[i] = lerp(posyInicial[i], programa.promedioPosY,f[i]);
   }
   }
   */
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
  //      if (posy[i]-height/6 <= posyDestino[i]) {
  //        //posY=limite_superior;
  //        shake = true;
  //      } else {

  //        shake = false;
  //      }
  //    } else if (programa.inter.seMoviaEnElFrameAnterior == false) {// cambio variable movPeque
  //      //println( posyInicial[i]);
  //      if (avance [i]<2) {
  //        avance[i] = avance[i]-vel[i];
  //        shake = false;
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

  void shaking() {
    for (int i=0; i<cant; i++) {
      if (shake) {
        posx[i]=random(posx[i]-1, posx[i]+1);
      } else {
        // posX=posX_inicial;
      }
    }
  }

  void debug() {
    pushStyle();
    fill(255, 0, 0);
    textSize(24);
    text("POSY " + posy[1], 50, 50);
    text("AVANCE " +avance[1], 50, 80);
    text("VEL " + vel[1], 50, 110);
    text("POSX " + posx[1], 50, 140);
    text("PX " + px, 50, 170);
    popStyle();
  }
}

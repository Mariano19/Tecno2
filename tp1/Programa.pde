class Programa {   
  //Clases  
  Sonido sonido;
  Interacciones inter;
  Fondo fondo;
  Circulos circulo;
  FigEspeciales especiales;
  Triangulos triangulo;
  Lineas linea;
  float px, py;
  float promedioPosX;
  float promedioPosY;


  Programa() {
    sonido = new Sonido();
    inter = new Interacciones();
    fondo = new Fondo(); 
    circulo = new Circulos();
    especiales = new FigEspeciales();
    triangulo = new Triangulos();
    linea = new Lineas();
  }

  //Funciones
  void actualizar() {
    fondo.actualizar();
    circulo.actualizar();
    especiales.actualizar();
    inter.actualizar();
    triangulo.actualizar();
    linea.actualizar();
    calcularCentro();    
    sonido.actualizar();
    
  }



  void calcularCentro() {

    float sumX = 0;
    float sumY = 0;
    int divisor = 0;
    for (int i=0; i<circulo.posx.length; i++) { //sumo clase circulo
      sumX += circulo.posx[i];
      sumY += circulo.posy[i];
      divisor ++;
    }

    for (int i=0; i<linea.posx.length; i++) { //sumo clase lineas
      sumX += linea.posx[i];
      sumY += linea.posy[i];
      divisor ++;
    }   

    promedioPosX = sumX/divisor;
    promedioPosY = sumY/divisor;
    //println(promedioPosX,promedioPosY);
    /*
    fill(0, 255, 0);
    ellipse(promedioPosX, promedioPosY, 50, 50);*/

    //float factor = map(mouseX, 0, width, -1, 1);
    float factor = map(mouseX,0,width,-1,1);
    for (int i=0; i<1; i++) {
      //println(factor);
      px = lerp(circulo.posx[i], promedioPosX, factor);
      py = lerp(circulo.posy[i], promedioPosY, factor);

      /*      
       ellipse(px, py, 10, 10);
       //println(px,py);
       image(circulo.circulos[2], px, py);*/
    }
  }
}

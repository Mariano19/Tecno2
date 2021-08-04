void iniciar() {

  //inicializando el mundo
  mundo = new FWorld();

  //configurar del mundo
  mundo.setGravity(0, 800);
  mundo.setEdges();
  /*mundo.remove(mundo.bottom);*/
  //mundo.remove(mundo.left);
  //mundo.remove(mundo.right);
  //mundo.remove(mundo.top);

 
    //=======
    //BODIES
    bola = new Bola();
    cesto = new Cesto();
    moneda = new Moneda();

    //Agrego los BODIES
    mundo.add( bola );
    mundo.add( cesto );
    mundo.add( moneda );


  
}
void escenario() {
 
  //plataformas
  
  //Propiedades plat1
  FBox plataforma1 = new FBox(500, 10);  
  plataforma1.setFill(0,0,255);  
  plataforma1.setRestitution(1.2); //Rebotes    
  plataforma1.setPosition( 100, height/3 );
  plataforma1.setRotation(radians(5));
  plataforma1.setStatic(true);
  plataforma1.setGrabbable(false);
  plataforma1.setName("plataforma1");
  mundo.add( plataforma1 );

  //Propiedades plat2
  FBox plataforma2 = new FBox(300, 10);  
  plataforma2.setFill(255,100,0);  
  plataforma2.setRestitution(2.0); //Rebotes    
  plataforma2.setPosition( width/1.8, height/1.8 );
  plataforma2.setRotation(radians(0));
  plataforma2.setStatic(true);
  plataforma2.setGrabbable(false);
  plataforma2.setName("plataforma1");
  mundo.add( plataforma2 );
  
  //Propiedades plat3
  FBox plataforma3 = new FBox(500, 10);
  plataforma3.setFill(0);
  plataforma3.setRestitution(0.1); //Rebotes 
  plataforma3.setPosition( width, height/2+100 );
  plataforma3.setRotation(radians(-10));
  plataforma3.setStatic(true);
  plataforma3.setGrabbable(false);
  plataforma3.setName("plataforma2");
  mundo.add( plataforma3 );
}

//funciones dibujo
void dibujar() {
  if (mundo.getBody(mouseX, mouseY) != null) {
    return;
  }

  poly = new FPoly();
  poly.setStrokeWeight(3);
  poly.setFill(120, 30, 90);
  poly.setDensity(10);
  poly.setRestitution(0.5);
  poly.setStatic(true);
  poly.setGrabbable(false);
  poly.setName("poly");
  poly.vertex(mouseX, mouseY);
}

void soltar() {
  if (poly!=null) {
    mundo.add(poly);
    poly = null;
  }
}

void arrastrar() {
  if (poly!=null) {
    poly.vertex(mouseX, mouseY);
  }
}

//==================================
// ANALISÍS DE CONTACTO

void contactStarted(FContact contacto) {
  FBody body1 = contacto.getBody1();
  FBody body2 = contacto.getBody2();

  if (body1.getName() != null && body2.getName() != null) {

    //SI LA BOLA TOCA A LA MONEDA LA MONEDA DESAPARECE
    if (body1.getName()=="bola" || body2.getName()=="bola" && body1.getName()=="moneda" || body2.getName()=="moneda") {
      mundo.remove(moneda);
      score +=1;
      estado="juego";
    } 
    //SI LA BOLA TOCA AL CESTO SE GANA
    else if (body1.getName()=="bola" || body2.getName()=="bola" && body1.getName()=="cesto" || body2.getName()=="cesto") {
      estado="win";
    }
  } else {
    //Si toca los edges de mundo se pierde (Habría que hacer que solo se pierda si se choca el mundo.bottom, pero no se como hacerlo)
    estado="lose";
  }
}



void iniciar() {

  //inicializando el mundo
  mundo = new FWorld();
  
  //configurar del mundo
  mundo.setGravity(0, 800);
  mundo.setEdges();
  /*mundo.remove(mundo.bottom);*/
  mundo.remove(mundo.left);
  mundo.remove(mundo.right);
  mundo.remove(mundo.top);

  bola = new Bola();
  //agrego la bala al mundo
  mundo.add( bola );  
}


void escenario() {
  //plataformas
  FBox plataforma1 = new FBox(1000, 10);
  plataforma1.setFill(0);
  plataforma1.setPosition( 100, height/3 );
  plataforma1.setRotation(radians(10));
  plataforma1.setStatic(true);
  plataforma1.setGrabbable(false);
  mundo.add( plataforma1 );
  
  FBox plataforma2 = new FBox(500, 10);
  plataforma2.setFill(0);
  plataforma2.setPosition( width, height/2 );
  plataforma2.setRotation(radians(10));
  plataforma2.setStatic(true);
  plataforma2.setGrabbable(false);
  mundo.add( plataforma2 );  
}

//funciones dibujo
void dibujar(){
  if (mundo.getBody(mouseX, mouseY) != null) {
    return;
  }

  poly = new FPoly();
  poly.setStrokeWeight(3);
  poly.setFill(120, 30, 90);
  poly.setDensity(10);
  poly.setRestitution(0.5);
  poly.setStatic(false);
  poly.vertex(mouseX, mouseY);
}

void soltar(){
  if (poly!=null) {
    mundo.add(poly);
    poly = null;
  }
}

void arrastrar(){
  if (poly!=null) {
    poly.vertex(mouseX, mouseY);
  }
}

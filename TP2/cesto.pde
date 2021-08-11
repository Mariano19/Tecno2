class Cesto extends FBox {
  PImage bandera;

  Cesto() {
    super(150, 500 );
    bandera = loadImage("bandera.png");
    //setFill(0, 255, 0);
    attachImage(bandera);

    //configuro el nombre
    setName("cesto");

    setStatic(true);
    setGrabbable(false);
    setVelocity(0, 0);
    //aplico una posicion inicial
    setPosition( 4500, 350);
  }
}

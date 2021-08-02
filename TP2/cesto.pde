class Cesto extends FBox {

  Cesto() {
    super(50, 50);

    setFill(0, 255, 0);

    //configuro el nombre
    setName("cesto");

    setStatic(true);
    setGrabbable(false);
    setVelocity(0, 0);
    //aplico una posicion inicial
    setPosition( random(50, width-50), height-30 );
  }
}

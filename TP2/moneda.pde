class Moneda extends FCircle {

  Moneda() {
    super(50);

    setFill(255, 255, 0);

    //configuro el nombre
    setName("moneda");

    setStatic(true);
    setGrabbable(false);
    setVelocity(0, 0);
    //aplico una posicion inicial
    setPosition( random(50, width-50), random(100,height-50) );
  }
  
}

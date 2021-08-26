class Moneda extends FCircle {
  PImage monedaimg;

  Moneda() {
    super(50);
    
    monedaimg = loadImage("moneda.png");
    monedaimg.resize(50, 50);

    

    //setFill(255, 255, 0);

    //configuro el nombre
    setName("moneda");
    attachImage(monedaimg);
    setStatic(true);
    setGrabbable(false);
    setVelocity(0, 0);
    //aplico una posicion inicial
    setPosition( random(2000, width-50), random(100, height-50) );
  }
}

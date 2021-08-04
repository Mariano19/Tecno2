

class Bola extends FCircle {

  String estado;
  float xOriginal = 100; //posicion inicial de la bola
  float yOriginal = 0; 
  long marca;


  Bola() {
    //llamando al constructor de la clase madre ( FCircle )
    super(50);
    setFill(255, 0, 0);
    //configura el rebote (entre 0 y 1)
    setRestitution(0.5);
    //configura la masa
    setDensity(100);
    //configuro el nombre
    setName("bola");

    setGrabbable(false);
    setStatic(false);
    //pongo la velocidad en 0
    setVelocity(0, 0);
    //aplico una posicion inicial
    setPosition( xOriginal, yOriginal );
  }
}

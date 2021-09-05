PImage bolaimg;

class Bola extends FCircle {

  String estado;
  float xOriginal = 100; //posicion inicial de la bola
  float yOriginal = 500; 
  long marca;


  Bola() {
    //llamando al constructor de la clase madre ( FCircle )
    super(50);
    bolaimg = loadImage("bola.png");
    bolaimg.resize(50, 50);
    //setFill(255, 0, 0);
    attachImage(bolaimg);
    //configura el rebote (entre 0 y 1)
    setRestitution(0.5);
    //configura la masa
    setDensity(50);
    //configuro el nombre
    setName("bola");

    //addImpulse(500,1000);
    //addTorque(500);
    //addForce(width,100);
    setVelocity(0, 0);
    //setForce(1000,1000);
    //addTorque(30000);
    //addForce (1000,1000);
    //Rotacion
    setAngularVelocity(60); 
    //setAngularDamping(0);
    setDamping(0);

    setGrabbable(false);
    setStatic(false);

    //BORRAR///////////////////////////////////
    /*setGrabbable(true);
     setStatic(true);*/
    //pongo la velocidad en 0
    //setVelocity(200, 0);
    //setVelocity(1,1);
    //aplico una posicion inicial
    setPosition( xOriginal, yOriginal );
  }

  void actualizarvel1() {
    //addForce (100, 0);  
    //addTorque(360);  
    addImpulse(30, 0);
  }
  void actualizarvel2() {
    //addForce (100, 0);  
    //addTorque(360);  
    addImpulse(400, 0);
  }
}

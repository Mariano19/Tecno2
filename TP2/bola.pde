PImage bolaimg;
PImage bolahud;
PImage progreso;

class Bola extends FCircle {

  String estado;
  float xOriginal = 100; //posicion inicial de la bola
  float yOriginal = 500; 
  long marca;


  Bola() {
    //llamando al constructor de la clase madre ( FCircle )
    super(50);
    bolaimg = loadImage("bola.png");
    bolahud = loadImage("bola.png");
    progreso = loadImage("progreso.png");
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
  
  void mapeo(){
    float w = map(bola.getX(),xOriginal,4*width,0,395);
    
    //fill(255,70);
    //stroke(0);
    //rect(width/2-200,30,400,10);
    image(progreso,width/2-200,30);
    fill(100,200,0);
    noStroke();
    rect(width/2-195,53,w,12,30);
    image(bolahud,width/2-200+w,30+15);
    bolahud.resize(30,30);
    //fill(255,0,0);
    //ellipse(width/2-200+w,35,20,20);
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

//Declaro imagenes
PImage fondoimg, fondovisual;
PImage ganaste;
PImage perdiste;
PImage cursor;
PImage[] plat = new PImage[5];
PImage[] nubes = new PImage [2];
PImage arbol;
PFont kinder;
PImage instrucciones;



void iniciar() {
  kinder = loadFont("Kindergarten-48.vlw");
  for (int i=0; i<5; i++) {
    plat[i]=loadImage("plat"+i+".png");
  }

  for (int i=0; i<2; i++) {
    nubes[i]=loadImage("nube"+i+".png");
  }
  //Imagenes obstaculos
  

  //Imagenes    
  fondoimg = loadImage("fondo2.png");
  fondovisual = loadImage("fondovisual.png");
  arbol = loadImage("arbol.png");
  cursor = loadImage("pencil.png");
  cursor.resize(40, 40);

  ganaste = loadImage("ganaste.png");
  perdiste = loadImage("perdiste.png");   
  instrucciones = loadImage("instrucciones.png");

  //inicializando el mundo
  mundo = new FWorld(-width, -height, 4*width, 2*height);

  //configurar el mundo
  mundo.setGravity(0, 800);
  mundo.setEdges(-width, -height, 4*width, 2*height);

  //mundo.remove(mundo.bottom);
  mundo.remove(mundo.left);
  //mundo.remove(mundo.right);
  mundo.remove(mundo.top);

  //img

  //=======
  //BODIES
  bola = new Bola();
  cesto = new Cesto();
  moneda = new Moneda();

  //Agrego los BODIES
  mundo.add( bola );
  mundo.add( cesto );
  //mundo.add( moneda );
}


void escenario() { 
  

  //Piso 1
  Plataforma piso = new Plataforma(1280+400, 30);    //1~tamanio
  piso.inicializar (400, 600, true);                //2~ubicacion //si es piso es true, si es plataforma es false
  mundo.add( piso );
  piso.attachImage(loadImage("piso0.png"));
  //piso.setFill(255,0,0);

  //Piso 2
  Plataforma piso2 = new Plataforma(400, 30);    
  piso2.inicializar (1200, 600, true);
  piso2.setRotation(radians(0));
  mundo.add( piso2 );
  piso2.attachImage(loadImage("piso1.png"));

  //piso 3
  Plataforma piso3 = new Plataforma(250, 30);    
  piso3.inicializar (2300, 650, true);  
  mundo.add( piso3 );
  piso3.attachImage(loadImage("piso2.png"));

  //piso 4
  Plataforma piso4 = new Plataforma(350, 30);    
  piso4.inicializar (3000, 720, true);
  piso4.setRotation(radians(10));
  mundo.add( piso4 );
  piso4.attachImage(loadImage("piso3.png"));

  //piso 5
  Plataforma piso5 = new Plataforma(500, 30);    
  piso5.inicializar (4200, 750, true);
  piso5.setRotation(radians(0));
  mundo.add( piso5 );
  piso5.attachImage(loadImage("piso4.png"));


  //paredes
  Plataforma pared1 = new Plataforma(10, 400);    
  pared1.inicializar (1390, 800, true);
  pared1.setRotation(radians(0));
  mundo.add( pared1 );

  Plataforma pared2 = new Plataforma(10, 400);    
  pared2.inicializar (2190, 860, true);
  pared2.setRotation(radians(0));
  mundo.add( pared2 );

  Plataforma pared3 = new Plataforma(10, 400);    
  pared3.inicializar (3165, 960, true);
  pared3.setRotation(radians(0));
  mundo.add( pared3 );

  Plataforma pared4 = new Plataforma(10, 400);    
  pared4.inicializar (3960, 960, true);
  pared4.setRotation(radians(0));
  mundo.add( pared4 );



  //Plataforma1
  Plataforma plataforma1 = new Plataforma(200, 10); 
  plataforma1.inicializar (1700, 900, false);   
  plataforma1.setName("plataforma1");
  plataforma1.setNoStroke();
  plataforma1.setNoFill();
  mundo.add( plataforma1 );  
  //plataforma1.setFill(0, 255, 0);

  //Plataforma2
  Plataforma plataforma2 = new Plataforma(300, 10); 
  plataforma2.inicializar (2500, 680, false);
  plataforma2.setRotation(radians(0));
  plataforma2.setRestitution(1.3); //le subi esto para hacerlo un poco más fácil
  plataforma2.setNoStroke();
  plataforma2.setNoFill();
  //plataforma2.setFill(255, 0, 0);
  plataforma2.setName("plataforma2");
  mundo.add( plataforma2 );  

  //Plataforma3
  Plataforma plataforma3 = new Plataforma(200, 10); 
  plataforma3.inicializar (3500, 820, false);
  plataforma3.setRotation(radians(0)); 
  plataforma3.setName("plataforma3");
  plataforma3.setRestitution(1.3);
  plataforma3.attachImage(loadImage("plat4.png"));
  //plataforma3.setFill(0, 0, 255);
  mundo.add( plataforma3 );  


  //Plataforma4
  Plataforma plataforma4 = new Plataforma(100, 10); 
  plataforma4.inicializar (3700, 620, false);
  plataforma4.setRotation(radians(0)); 
  plataforma4.setName("plataforma4");
  plataforma4.attachImage(loadImage("plat1.png"));
  mundo.add( plataforma4 );    
  //plataforma4.setFill(255, 255, 0);



  //OBSTACULOS
  Obstaculo agua1 = new Obstaculo(750, 200, "agua"); 
  agua1.inicializar (1800, 1050);   
  agua1.setName("agua1");
  mundo.add( agua1 );  


  Obstaculo agua2 = new Obstaculo(750, 200, "agua"); 
  agua2.inicializar (3550, 950);   
  agua2.setName("agua2");
  mundo.add( agua2 );


  Obstaculo arbol = new Obstaculo(150, 280, "arbol"); 
  arbol.inicializar (2720, 585);   
  arbol.setName("arbol");
  mundo.add( arbol );


  Obstaculo nube1 = new Obstaculo(250, 100, "nube"); 
  nube1.inicializar (random(2020, 2500), 150);   
  nube1.setName("nube1");
  mundo.add( nube1 );
  nube1.attachImage(nubes[0]);

  Obstaculo nube2 = new Obstaculo(250, 100, "nube"); 
  nube2.inicializar (random(3400, 3800), 150);   
  nube2.setName("nube2");
  nube2.attachImage(nubes[1]);
  mundo.add( nube2 );
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
    //SI TOCA LAS PLATAFORMAS REPRODUCE SONIDO
    else if (body1.getName()=="bola" || body2.getName()=="bola" && body1.getName()=="plataforma2" || body2.getName()=="plataforma2" || body1.getName()=="plataforma1" || body2.getName()=="plataforma1" || body1.getName()=="plataforma3" || body2.getName()=="plataforma3" || body1.getName()=="plataforma4" || body2.getName()=="plataforma4") {
      bounce.play();
      bounce.rewind();
    } 
    //SI TOCA AGUA PIERDE
    else if (body1.getName()=="bola" || body2.getName()=="bola" && body1.getName()=="agua1" || body2.getName()=="agua1" || body1.getName()=="agua2" || body2.getName()=="agua2") {
      water.play();
      water.rewind();
      estado="lose";
    }
  } else {
    //Si toca los edges de mundo se pierde (Habría que hacer que solo se pierda si se choca el mundo.bottom, pero no se como hacerlo)
    estado="lose";
  }
}

void sonido() {
  musica.loop();
}

//DEBuG
//void debug() {  
//  println(frameRate, "|| Posx*bola  " + bola.getX(), (mouseX+bola.getX()-300) + " || posxMouse absoluto" + mouseX, bola.getVelocityX());
//}

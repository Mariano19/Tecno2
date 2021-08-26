import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import fisica.*;

//clases 
FWorld mundo;
Portada portada;
Creditos creditos;
Instr instr;
Trazos[] trazos;
//FPoly poly;
FCircle trazo;
Bola bola;
Cesto cesto;
Moneda moneda;
Plataforma plataforma;
Obstaculo obstaculo;
Minim minim;


//Sonido
AudioPlayer musica;
AudioPlayer bounce;
AudioPlayer blob;

//Declaro imagenes
PImage aguavisual;
PImage aguavisual2;
PImage fondoimg;
PImage ganaste;
PImage perdiste;
PImage cursor;
PImage[] plat = new PImage[5];
PImage[] nubes = new PImage [2];
PImage arbol;
PFont kinder;

PImage instrucciones;


//Color fondo
color fondo = color(255);
int score;
int i=0;


//ArrayList
ArrayList<Trazos> trazoAL;

//estados del juego
String estado;

//Variables de movimiento de agua
float dir = 1;
float step = 1;
float pos=910;
float dir2 = 1;
float step2 = 0.9;
float pos2=910;

void setup() {
  trazoAL = new ArrayList<Trazos>();

  noCursor();
  textAlign(CENTER);
  rectMode(CORNER);
  portada = new Portada();
  creditos = new Creditos();
  instr = new Instr();
  score = 0;
  size( 1280, 720 );
  estado = "portada";
  kinder = loadFont("Kindergarten-48.vlw");
  

  //Imagenes obstaculos
  aguavisual = loadImage("aguav1.png");
  aguavisual2 = loadImage("aguav2.png");
  
  //Imagenes    
  fondoimg = loadImage("fondo2.png");
  arbol = loadImage("arbol.png");
  cursor = loadImage("pencil.png");
  cursor.resize(40, 40);

  ganaste = loadImage("ganaste.png");
  perdiste = loadImage("perdiste.png");   
  instrucciones = loadImage("instrucciones.png");

  //sonido
  minim = new Minim(this);
  musica = minim.loadFile("musica.mp3", 2048);
  bounce = minim.loadFile("bounce.wav", 2048);

  blob = minim.loadFile("blob.mp3", 2048);
  blob.setGain(-10.0);
  bounce.setGain(-10.0);
  sonido();



  //plat1 = loadImage("plat1.png"); 
  for (int i=0; i<5; i++) {
    plat[i]=loadImage("plat"+i+".png");
  }

  for (int i=0; i<2; i++) {
    nubes[i]=loadImage("nube"+i+".png");
  }



  //iniciar Fisica
  Fisica.init(this);

  iniciar();
  escenario();
}

void draw() {

  println("ESTADO: "+ estado);
  background(0);
  debug();
  i -=1;
  if (estado.equals("juego")) {
    image(fondoimg, i, 0);
    image(fondoimg, 2899+i, 0);
  }

  //borrarTrazo();
  portada.dibujar();
  creditos.dibujar();
  instr.dibujar();

  //Estado juego
  if (estado.equals("juego")) {    
    mundo.step();
    translate( 300-bola.getX(), 450-bola.getY() ); //mueve la camara con la bola
    
    movAgua();
    movAgua2();

    for(int i =trazoAL.size()-1;i>=0;i--){
      trazoAL.get(i).actualizarMatar();
      if(trazoAL.get(i).muerto){
        mundo.remove(trazoAL.get(i));
        trazoAL.remove(i);
      }
    }

    //PUNTAJE
    fill(0);
    textFont(kinder);
    text("Puntaje:" + score, bola.getX()-150, bola.getY()-400);
    textSize(20);
    text("Presiona R para reiniciar", bola.getX()+800, bola.getY()-400);
    image(instrucciones, -50, 200);

    mundo.draw();
    
    if (bola.getX() < width-600){    //hace lenta la bola para las instrucciones y luego acelera  
       bola.actualizarvel1();
    }
    else {
      bola.actualizarvel2();
    }
    
    //dibujo mientras se crea la forma
    /*if (poly != null) {
     poly.draw(this);
     }*/
    pushStyle();
    imageMode(CORNER);
    image(cursor, mouseX+bola.getX()-300, mouseY+bola.getY()-470);
    popStyle();
  }

  //Estado ganador/perdedor
  if (estado.equals("win")) {
    pushStyle();
    fondo = color(0, 255, 0);
    //fill(fondo);
    //rect(0, 0, width*4, height);    
    image(ganaste, 0, 0);
    textSize(40);    
    fill(0);
    text("Puntaje:" + score, width/2, height/2 + 20);

    popStyle();
  } else if (estado.equals("lose")) {
    pushStyle();
    fondo = color(255, 0, 0);
    image(perdiste, 0, 0);
    fill(0);
    textSize(40);
    text("Puntaje:" + score, width/2, height/2 + 20);
    popStyle();
  }
}

void mousePressed() {  
  
  if (estado.equals("portada")) {
    portada.jugar();
  }
  if (estado.equals("creditos")) {
    creditos.volver();
  }
  if (estado.equals("instrucciones")) {
    instr.volver();
  }
}

void mouseDragged() {
  if (estado.equals("juego")) {
    Trazos trazo = new Trazos(16);
    trazo.setPosition(mouseX+bola.getX()-300, mouseY+bola.getY()-470);
    mundo.add(trazo);
    trazoAL.add(trazo);
    //trazo();    
  }
}

void keyPressed() {
  //RESET
  if ( estado.equals("lose") || estado.equals("win")  ) {
    estado="juego";
    iniciar();
    escenario();
    score = 0;
    i = 0;
  }
  //Reinicio
  if ( estado.equals("juego") && key == 'r') {
    iniciar();
    escenario();
    score = 0;
    i = 0;
  } 

  //test//////////////////////////////////////////////////////////////
  if ( estado.equals("juego") && keyCode == RIGHT) {    
    bola.setPosition( bola.xOriginal +=200, bola.yOriginal );
  }
  if ( estado.equals("juego") && keyCode == LEFT) {    
    bola.setPosition( bola.xOriginal -=200, bola.yOriginal );
  }
  if ( estado.equals("juego") && keyCode == UP) {    
    bola.setPosition( bola.xOriginal, bola.yOriginal -=100);
  }
  if ( estado.equals("juego") && keyCode == DOWN) {    
    bola.setPosition( bola.xOriginal, bola.yOriginal +=100);
  }
}

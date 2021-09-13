import garciadelcastillo.dashedlines.*;
import gab.opencv.*;
import processing.video.*;
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
Ganar ganar;
Perder perder;
Creditos creditos;
Instr instr;
Trazos[] trazos;
FCircle trazo;
Bola bola;
Cesto cesto;
Moneda moneda;
Plataforma plataforma;
Obstaculo obstaculo;
Minim minim;
DashedLines dash;
Animaciones animaciones;

//Sonido
AudioPlayer musica;
AudioPlayer bounce;
AudioPlayer blob;
AudioPlayer water;

//=================================
//CALIBRACIÓN DEL VIDEO

Capture camara;
OpenCV opencv;
int ancho = 640;//ancho de la camara(no funciona ahora mismo)
int alto = 480;//alto de la camara(no funciona ahora mismo)
int umbral = 252;//umbral de luz (0-255) Modificar según situación de luz
//==============================


color fondo = color(255);
int score;
int i=0;

//ArrayList de trazos
ArrayList<Trazos> trazoAL;

//estados del juego
String estado;


void setup() {
  size( 1280, 720 );
  noCursor();
  textAlign(CENTER);
  rectMode(CORNER);
  estado = "win";
  Fisica.init(this);
  iniciar();
  escenario();
  
  dash = new DashedLines(this);
  dash.pattern(10,10);
  animaciones = new Animaciones();
  trazoAL = new ArrayList<Trazos>();  
  portada = new Portada();
  ganar = new Ganar();
  perder = new Perder();
  creditos = new Creditos();
  instr = new Instr();
  score = 0;  

  //====VIDEO===================================
  String[] listaDeCamaras = Capture.list(); //Devuelve una lista de todas las camaras disponibles
  printArray(listaDeCamaras); //Imprime la lista
  camara = new Capture( this, ancho, alto, "DroidCam Source 3"); //Selecciona que camara usar  
  //camara = new Capture( this, ancho, alto, "Microsoft LifeCam HD-5001"); //Selecciona que camara usar
  //camara = new Capture(this,ancho,alto)  //Utiliza la primer camara que encuentra
  camara.start();
  opencv = new OpenCV(this, ancho, alto);
  opencv.invert();
  //==============================================

  //====SONIDO===================================
  minim = new Minim(this);
  water = minim.loadFile("water.mp3", 2048);
  musica = minim.loadFile("musica.mp3", 2048);
  bounce = minim.loadFile("bounce.wav", 2048);
  blob = minim.loadFile("blob.mp3", 2048);
  blob.setGain(-10.0);
  bounce.setGain(-10.0);
  sonido();  
  //==============================================
}

void draw() {

  i-=1;
  portada.dibujar();
  portada.boton();
  creditos.dibujar();
  instr.dibujar();

  //Estado juego sin translate
  if (estado.equals("juego")) {    
    image(fondoimg, i, 0);
    image(fondoimg, 2899+i, 0);      
  }

  //Estado juego con translate
  if (estado.equals("juego")) {    
    mundo.step();
    translate( 300-bola.getX(), 450-bola.getY() ); //mueve la camara con la bola    
    animaciones.dibujar();    

    //HACER QUE EL TRAZADO DESAPAREZCA 
    for (int i =trazoAL.size()-1; i>=0; i--) {
      trazoAL.get(i).actualizarMatar();
      if (trazoAL.get(i).muerto) {
        mundo.remove(trazoAL.get(i));
        trazoAL.remove(i);
      }
    }

    //========VIDEO============
    if (camara.available()) {
      camara.read();
      //cargo en OpenCv la imagen de la camara
      opencv.loadImage( camara );
      //aplico el umbral
      opencv.threshold(umbral);

      PImage salida = opencv.getOutput();
      
      //Dibujo la camara con umbral en el canvas
      pushStyle();
      blendMode(ADD);
      image(salida, bola.getX()-150, bola.getY()-300);
      popStyle();
      
      //Devuelve el punto más brillante de la camara
      PVector pixelMasBrillante = opencv.max();

      //Hago el trazo en las cordenadas del pixel más brillante
      Trazos trazo = new Trazos(16);
      trazo.setPosition(pixelMasBrillante.x+bola.getX()-150, pixelMasBrillante.y+bola.getY()-300);
      mundo.add(trazo);
      trazoAL.add(trazo);
    }
    //============================
    
    //PUNTAJE
    fill(0);
    textFont(kinder);
    text("Puntaje:" + score, bola.getX()-150, bola.getY()-400);
    textSize(20);
    //text("Presiona R para reiniciar", bola.getX()+800, bola.getY()-400);
    image(instrucciones, -50, 200);

    mundo.draw();
    image(fondovisual, -295, 600);

    if (bola.getX() < width-600) {    //hace lenta la bola para las instrucciones y luego acelera  
      bola.actualizarvel1();
    } else {
      bola.actualizarvel2();
    }

    pushStyle();
    PVector pixelMasBrillante = opencv.max();
    imageMode(CORNER);
    image(cursor, pixelMasBrillante.x+bola.getX()-150, pixelMasBrillante.y+bola.getY()-300);
    popStyle();
  }

  //Estado ganador/perdedor
  if (estado.equals("win")) {
    ganar.pantalla();
    ganar.boton();
  } else if (estado.equals("lose")) {
    perder.pantalla();
    perder.boton();
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
  }/*
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
  }*/
}

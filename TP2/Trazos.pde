class Trazos extends FCircle{
  boolean muerto;
  
  //CAMBIAR VIDA PARA QUE TARDE MÁS O MENOS EN DESAPARECER EL TRAZO
  float vida = 150;
  float opacidad = 255;
  
  
  Trazos(float medida){
    super(medida);
    muerto = false;
    setName("trazo");    
    setNoStroke();
    setStatic(true);
    setGrabbable(false);
}

  void actualizarMatar(){
    setFill(20,opacidad);
    vida--;
    opacidad-=1.5;
    if(vida<=0){
      matar();
    }
  }
  
  void matar(){
    muerto = true;
  }
  
}

class Trazos extends FCircle{
  boolean muerto;
  
  //CAMBIAR VIDA PARA QUE TARDE MÁS O MENOS EN DESAPARECER EL TRAZO
  float vida = 150;
  
  
  Trazos(float medida){
    super(medida);
    muerto = false;
    setName("trazo");
    setFill(20);
    setNoStroke();
        setStatic(true);
    setGrabbable(false);
}

  void actualizarMatar(){
    vida--;
    if(vida<=0){
      matar();
    }
  }
  
  void matar(){
    muerto = true;
  }
  
}

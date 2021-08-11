class Plataforma extends FBox{

  Plataforma(float _w, float _h)
  {
    super(_w, _h);
  }
  
  void inicializar(float _x, float _y, Boolean _piso)
  {
    setPosition(_x, _y);
    setName("plataforma");
    setStatic(true);
    setGrabbable(false);
    setRestitution(0);
    setFill(0);
    
    if (!_piso)
    {      
      setRestitution(1.2); //Rebotes 
      setFill(0,255,0);
    }
  }
  
}  

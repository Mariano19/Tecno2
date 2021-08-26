class Obstaculo extends FBox {
  PImage agua;
  

  String tipo;

  Obstaculo(float _w, float _h, String _tipo)
  {
    super(_w, _h);

    tipo = _tipo;
  }

  void inicializar(float _x, float _y)
  {
    if (tipo.equals("agua"))
    {

      agua = loadImage("agua.png");
      setName("agua");
      setStatic(true);
      setNoStroke();
      setNoFill();
      //attachImage(loadImage("agua.png"));
    } else if (tipo.equals("arbol"))
    {
      setName("arbol");
      setStatic(true);
      setRestitution(0.5);
      attachImage(loadImage("arbol.png"));
    } else if (tipo.equals("nube"))
    {


      setName("nube");
      setStatic(true);
      //attachImage(loadImage("nube.png"));
    }


    setPosition(_x, _y);
    setRotatable(false);
  }
}

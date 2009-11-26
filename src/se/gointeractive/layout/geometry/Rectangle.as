package se.gointeractive.layout.geometry
{
  public class Rectangle
  {
    private var _position : Position;
    private var _dimensions : Dimensions;
    
    public function Rectangle
      (position : Position, dimensions : Dimensions)
    {
      _position = position;
      _dimensions = dimensions;
    }
    
    public static function of
      (position : Position, dimensions : Dimensions) : Rectangle
    { return new Rectangle(position, dimensions); }
    
    public function toString() : String
    { return dimensions + "@" + position; }
    
    public function get dimensions() : Dimensions
    { return _dimensions; }
    
    public function get position() : Position
    { return _position; }
  }
}

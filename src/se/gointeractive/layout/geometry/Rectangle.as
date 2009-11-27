package se.gointeractive.layout.geometry
{
  import org.asspec.util.EqualityComparable;
  
  public class Rectangle implements EqualityComparable
  {
    private var _position : Position;
    private var _dimensions : Dimensions;
    
    public function Rectangle
      (position : Position, dimensions : Dimensions)
    {
      _position = position;
      _dimensions = dimensions;
    }
    
    public function equals(other : EqualityComparable) : Boolean
    {
      return other is Rectangle
        && Rectangle(other).position.equals(position)
        && Rectangle(other).dimensions.equals(dimensions);
    }
    
    public function get dimensions() : Dimensions
    { return _dimensions; }
    
    public function get position() : Position
    { return _position; }
    
    public function toString() : String
    { return dimensions + "@" + position; }
    
    public static function of
      (position : Position, dimensions : Dimensions) : Rectangle
    { return new Rectangle(position, dimensions); }
  }
}

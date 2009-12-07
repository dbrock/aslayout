package se.gointeractive.layout.geometry
{
  import org.asspec.util.EqualityComparable;
  
  public class Position implements EqualityComparable
  {
    private var _x : Number;
    private var _y : Number;
    
    public function Position(x : Number, y : Number)
    {
      _x = x;
      _y = y;
    }
    
    public function equals(other : EqualityComparable) : Boolean
    {
      return other is Position
        && Position(other).x == x
        && Position(other).y == y;
    }
    
    public function get x() : Number
    { return _x; }
    
    public function get y() : Number
    { return _y; }
    
    public function offsetFrom(other : Position) : Offset
    { return Offset.of(x - other.x, y - other.y); }
    
    public function offsetTo(other : Position) : Offset
    { return other.offsetFrom(this); }
    
    public function toString() : String
    { return "(" + x + ", " + y + ")"; }
    
    public static function get ORIGIN() : Position
    { return Position.of(0, 0); }
    
    public static function of(x : Number, y : Number) : Position
    { return new Position(x, y); }
  }
}

package se.gointeractive.layout.geometry
{
  import org.asspec.util.EqualityComparable;
  
  public class Position implements EqualityComparable
  {
    public var x : Number;
    public var y : Number;
    
    public function equals(other : EqualityComparable) : Boolean
    {
      return other is Position
        && Position(other).x == x
        && Position(other).y == y;
    }
    
    public static function of(x : Number, y : Number) : Position
    {
      const result : Position = new Position;
      
      result.x = x;
      result.y = y;
      
      return result;
    }
    
    public static function get ORIGIN() : Position
    { return Position.of(0, 0); }
    
    public function toString() : String
    { return "(" + x + ", " + y + ")"; }
  }
}

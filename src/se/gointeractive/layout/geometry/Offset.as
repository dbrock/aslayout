package se.gointeractive.layout.geometry
{
  import org.asspec.util.EqualityComparable;
  
  public class Offset implements EqualityComparable
  {
    private var _dx : Number;
    private var _dy : Number;
    
    public function Offset(dx : Number, dy : Number)
    {
      _dx = dx;
      _dy = dy;
    }
    
    public function equals(other : EqualityComparable) : Boolean
    {
      return other is Offset
        && Offset(other).dx == dx
        && Offset(other).dy == dy;
    }
    
    public function get dx() : Number
    { return _dx; }
    
    public function get dy() : Number
    { return _dy; }
    
    public function scaledBy(scalar : Number) : Offset
    { return Offset.of(dx * scalar, dy * scalar); }
    
    public function get normalized() : Offset
    { return scaledBy(1 / length); }
    
    public function get length() : Number
    { return Math.sqrt(dx * dx + dy * dy); }
    
    public function toString() : String
    {
      return "{"
        + getCoordinateString(dx) + ", "
        + getCoordinateString(dy) + "}";
    }
    
    private function getCoordinateString(value : Number) : String
    { return (value > 0 ? "+" : "") + value; }
    
    public static function get ZERO() : Offset
    { return Offset.of(0, 0); }
    
    public static function of(dx : Number, dy : Number) : Offset
    { return new Offset(dx, dy); }
  }
}

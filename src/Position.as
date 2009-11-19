package
{
  public class Position
  {
    public var x : Number;
    public var y : Number;
    
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
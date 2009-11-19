package se.gointeractive.layout.geometry
{
  public class Rectangle
  {
    public var position : Position;
    public var dimensions : Dimensions;
    
    public static function of
      (position : Position, dimensions : Dimensions) : Rectangle
    {
      const result : Rectangle = new Rectangle;
      
      result.position = position;
      result.dimensions = dimensions;
      
      return result;
    }
    
    public function toString() : String
    { return dimensions + "@" + position; }
  }
}

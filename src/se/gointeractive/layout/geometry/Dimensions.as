package se.gointeractive.layout.geometry
{
  public class Dimensions
  {
    public var width : Number;
    public var height : Number;

    public static function of(width : Number, height : Number) : Dimensions
    {
      const result : Dimensions = new Dimensions;
      
      result.width = width;
      result.height = height;
      
      return result;
    }
    
    public function toString() : String
    { return width + "x" + height; }
    
    public function rectangleAt(position : Position) : Rectangle
    { return Rectangle.of(position, this); }
    
    public function get asRectangle() : Rectangle
    { return rectangleAt(Position.ORIGIN); }
    
    public function get asPosition() : Position
    { return Position.of(width, height); }
    
    public function fitsInside(container : Dimensions) : Boolean
    { return width <= container.width && height <= container.height; }
  }
}

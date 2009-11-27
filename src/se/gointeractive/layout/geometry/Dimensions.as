package se.gointeractive.layout.geometry
{
  import org.asspec.util.EqualityComparable;
  
  public class Dimensions implements EqualityComparable
  {
    private var _width : Number;
    private var _height : Number;
    
    public function Dimensions(width : Number, height : Number)
    {
      _width = width;
      _height = height;
    }
    
    public function equals(other : EqualityComparable) : Boolean
    {
      return other is Dimensions
        && Dimensions(other).width == width
        && Dimensions(other).height == height;
    }
    
    public function get width() : Number
    { return _width; }
    
    public function get height() : Number
    { return _height; }
    
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

    public static function of(width : Number, height : Number) : Dimensions
    { return new Dimensions(width, height); }
    
    public static function parse(input : String) : Dimensions
    {
      const parts : Array = input.split("x");
      
      return Dimensions.of(parseDimension(parts[0]), parseDimension(parts[1]));
    }
    
    private static function parseDimension(input : String) : Number
    { return input == "?" ? NaN : parseFloat(input); }
  }
}

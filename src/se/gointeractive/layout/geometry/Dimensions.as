package se.gointeractive.layout.geometry
{
  public class Dimensions
  {
    private var _width : Number;
    private var _height : Number;
    
    public function Dimensions(width : Number, height : Number)
    {
      _width = width;
      _height = height;
    }

    public static function of(width : Number, height : Number) : Dimensions
    { return new Dimensions(width, height); }
    
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
    
    public function get width() : Number
    { return _width; }
    
    public function get height() : Number
    { return _height; }
  }
}

package se.gointeractive.layout.linear
{
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.geometry.Position;
  
  public class HorizontalAlignment implements Alignment
  {
    public function getPrimaryDimension(dimensions : Dimensions) : Number
    { return dimensions.width; }
    
    public function getSecondaryDimension(dimensions : Dimensions) : Number
    { return dimensions.height; }
    
    public function getDimensions
      (primary : Number, secondary : Number) : Dimensions
    { return Dimensions.of(primary, secondary); }
    
    public function getPosition
      (primary : Number, secondary : Number) : Position
    { return Position.of(primary, secondary); }
  }
}

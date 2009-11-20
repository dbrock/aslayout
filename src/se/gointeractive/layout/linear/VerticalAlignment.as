package se.gointeractive.layout.linear
{
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.geometry.Position;
  
  internal class VerticalAlignment implements Alignment
  {
    public function getPrimaryDimension(dimensions : Dimensions) : Number
    { return dimensions.height; }
    
    public function getSecondaryDimension(dimensions : Dimensions) : Number
    { return dimensions.width; }
    
    public function getDimensions
      (primary : Number, secondary : Number) : Dimensions
    { return Dimensions.of(secondary, primary); }
    
    public function getPosition
      (primary : Number, secondary : Number) : Position
    { return Position.of(secondary, primary); }
  }
}

package se.gointeractive.layout.linear
{
  import se.gointeractive.layout.geometry.Dimensions;
  
  public class WidthPicker implements DimensionPicker
  {
    public function getPrimaryDimension(dimensions : Dimensions) : Number
    { return dimensions.width; }
    
    public function getSecondaryDimension(dimensions : Dimensions) : Number
    { return dimensions.height; }
    
    public function getDimensions
      (primary : Number, secondary : Number) : Dimensions
    { return Dimensions.of(primary, secondary); }
  }
}

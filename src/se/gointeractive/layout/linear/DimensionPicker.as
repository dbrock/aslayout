package se.gointeractive.layout.linear
{
  import se.gointeractive.layout.geometry.Dimensions;
  
  public interface DimensionPicker
  {
    function getPrimaryDimension(dimensions : Dimensions) : Number;
    function getSecondaryDimension(dimensions : Dimensions) : Number;
    function getDimensions(primary : Number, secondary : Number) : Dimensions;
  }
}

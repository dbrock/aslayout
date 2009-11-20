package se.gointeractive.layout.linear
{
  import se.gointeractive.layout.geometry.Dimensions;
  
  internal interface Alignment
  {
    function getPrimaryDimension(dimensions : Dimensions) : Number;
    function getSecondaryDimension(dimensions : Dimensions) : Number;
    function getDimensions(primary : Number, secondary : Number) : Dimensions;
  }
}

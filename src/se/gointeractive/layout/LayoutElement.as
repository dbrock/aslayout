package se.gointeractive.layout
{
  import se.gointeractive.layout.geometry.Dimensions;
  
  public interface LayoutElement
  {
    function set allocatedDimensions(value : Dimensions) : void;
    function get preferredDimensions() : Dimensions;
  }
}

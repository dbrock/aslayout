package se.gointeractive.layout
{
  import se.gointeractive.layout.geometry.Dimensions;
  
  public interface FlexibleLayoutElement extends LayoutElement
  { function set allocatedDimensions(value : Dimensions) : void; }
}

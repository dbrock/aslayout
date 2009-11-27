package se.gointeractive.layout.container
{
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;
  
  public class FakeElement implements LayoutElement
  {
    public function get preferredDimensions() : Dimensions
    { return null; }
    
    public function set allocatedDimensions(value : Dimensions) : void
    {}
  }
}

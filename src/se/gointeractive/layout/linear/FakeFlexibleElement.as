package se.gointeractive.layout.linear
{
  import se.gointeractive.layout.FlexibleLayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;

  public class FakeFlexibleElement
    extends FakeElement implements FlexibleLayoutElement
  {
    private var _allocatedDimensions : Dimensions;
    
    public function get allocatedDimensions() : Dimensions
    { return _allocatedDimensions; }
    
    public function set allocatedDimensions(value : Dimensions) : void
    { _allocatedDimensions = value; }
  }
}

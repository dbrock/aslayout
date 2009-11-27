package se.gointeractive.layout.linear.specification
{
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;

  internal class FakeFlexibleElement
    extends FakeElement implements LayoutElement
  {
    private var _allocatedDimensions : Dimensions;
    
    public function get allocatedDimensions() : Dimensions
    { return _allocatedDimensions; }
    
    public function set allocatedDimensions(value : Dimensions) : void
    { _allocatedDimensions = value; }
    
    public function get preferredDimensions() : Dimensions
    { return null; }
  }
}

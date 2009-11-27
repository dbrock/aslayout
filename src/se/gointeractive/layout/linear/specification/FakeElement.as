package se.gointeractive.layout.linear.specification
{
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.geometry.Position;
  
  internal class FakeElement implements LayoutElement
  {
    private var _dimensions : Dimensions;
    private var _allocatedDimensions : Dimensions;
    
    public var position : Position;
    
    public function FakeElement(dimensions : Dimensions)
    { _dimensions = dimensions; }
    
    public function get preferredDimensions() : Dimensions
    { return _dimensions; }
    
    public function get allocatedDimensions() : Dimensions
    { return _allocatedDimensions; }
    
    public function set allocatedDimensions(value : Dimensions) : void
    { _allocatedDimensions = value; }
  }
}

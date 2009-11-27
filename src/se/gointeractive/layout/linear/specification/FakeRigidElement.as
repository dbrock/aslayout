package se.gointeractive.layout.linear.specification
{
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;
  
  internal class FakeRigidElement
    extends FakeElement implements LayoutElement
  {
    private var _dimensions : Dimensions;

    public function FakeRigidElement(dimensions : Dimensions)
    { _dimensions = dimensions; }
    
    public function get preferredDimensions() : Dimensions
    { return _dimensions; }
    
    public function set allocatedDimensions(value : Dimensions) : void
    {}
  }
}

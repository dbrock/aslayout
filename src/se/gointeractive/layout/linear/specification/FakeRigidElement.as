package se.gointeractive.layout.linear.specification
{
  import se.gointeractive.layout.RigidLayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.geometry.Position;
  
  internal class FakeRigidElement
    extends FakeElement implements RigidLayoutElement
  {
    private var _dimensions : Dimensions;

    public function FakeRigidElement(dimensions : Dimensions)
    { _dimensions = dimensions; }
    
    public function get rigidDimensions() : Dimensions
    { return _dimensions; }
  }
}

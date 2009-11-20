package se.gointeractive.layout.linear
{
  import se.gointeractive.layout.RigidLayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.geometry.Position;
  
  public class FakeRigidElement
    extends FakeElement implements RigidLayoutElement
  {
    private var _dimensions : Dimensions;

    public function FakeRigidElement(dimensions : Dimensions)
    { _dimensions = dimensions; }
    
    public function get preferredDimensions() : Dimensions
    { return _dimensions; }
  }
}

package se.gointeractive.layout.container
{
  import se.gointeractive.layout.RigidLayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.geometry.Position;
  
  public class FakeElement implements RigidLayoutElement
  {
    public function get rigidDimensions() : Dimensions
    { return null; }
  }
}

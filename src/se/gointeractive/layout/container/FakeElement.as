package se.gointeractive.layout.container
{
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.geometry.Position;
  
  public class FakeElement implements LayoutElement
  {
    public function get preferredDimensions() : Dimensions
    { return null; }
  }
}

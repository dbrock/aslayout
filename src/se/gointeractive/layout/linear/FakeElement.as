package se.gointeractive.layout.linear
{
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.geometry.Position;
  
  public class FakeElement implements LayoutElement
  {
    private var _dimensions : Dimensions;
    
    internal var position : Position;

    public function FakeElement(dimensions : Dimensions)
    { _dimensions = dimensions; }
    
    public function get preferredDimensions() : Dimensions
    { return _dimensions; }
  }
}

package
{
  public class FakeElement implements LayoutableElement
  {
    private var _dimensions : Dimensions;
    
    internal var position : Position;

    public function FakeElement(dimensions : Dimensions)
    { _dimensions = dimensions; }
    
    public function get preferredDimensions() : Dimensions
    { return _dimensions; }
  }
}

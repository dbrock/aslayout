package
{
  public class FakeLayoutable implements Layoutable
  {

    private var _dimensions : Dimensions;
    private var _bounds : Rectangle;

    public function FakeLayoutable(dimensions : Dimensions)
    { this._dimensions = dimensions; }
    
    public function get dimensions() : Dimensions
    { return _dimensions; }
    
    public function get bounds() : Rectangle
    { return _bounds; }
    
    public function set bounds(value : Rectangle) : void
    { _bounds = value; }

  }
}
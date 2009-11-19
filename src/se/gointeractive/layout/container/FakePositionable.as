package se.gointeractive.layout.container
{
  import se.gointeractive.layout.Position;

  public class FakePositionable implements Positionable
  {
    private var _position : Position;
    
    public function get position() : Position
    { return _position; }
    
    public function set position(value : Position) : void
    { _position = value; }
  }
}

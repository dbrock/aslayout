package se.gointeractive.layout.linear
{
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Position;

  public class FakePositioner implements LayoutPositioner
  {
    public function moveElement
      (element : LayoutElement, position : Position) : void
    { FakeElement(element).position = position; }
  }
}

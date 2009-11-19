package se.gointeractive.layout
{
  import se.gointeractive.layout.geometry.Position;

  public class FakeParent implements LayoutParent
  {
    public function moveElement
      (element : LayoutElement, position : Position) : void
    { FakeElement(element).position = position; }
  }
}

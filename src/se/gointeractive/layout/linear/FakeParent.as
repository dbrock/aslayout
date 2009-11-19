package se.gointeractive.layout.linear
{
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.LayoutParent;
  import se.gointeractive.layout.geometry.Position;

  public class FakeParent implements LayoutParent
  {
    public function moveElement
      (element : LayoutElement, position : Position) : void
    { FakeElement(element).position = position; }
  }
}

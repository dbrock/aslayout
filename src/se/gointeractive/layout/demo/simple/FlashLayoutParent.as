package se.gointeractive.layout.demo.simple
{
  import flash.display.DisplayObject;
  
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Position;

  public class FlashLayoutParent implements LayoutPositioner
  {
    public function moveElement
      (element : LayoutElement, position : Position) : void
    {
      DisplayObject(element).x = position.x;
      DisplayObject(element).y = position.y;
    }
  }
}
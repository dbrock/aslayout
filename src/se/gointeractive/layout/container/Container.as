package se.gointeractive.layout.container
{
  import flash.utils.Dictionary;
  
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Position;
  
  public class Container implements LayoutPositioner
  {
    private const elementContainer : Dictionary = new Dictionary;
    
    public function add
      (logicalElement : LayoutElement,
       physicalElement : Positionable) : void
    { elementContainer[logicalElement] = physicalElement; }
    
    public function moveElement
      (element : LayoutElement, position : Position) : void
    { Positionable(elementContainer[element]).position = position; }
  }
}

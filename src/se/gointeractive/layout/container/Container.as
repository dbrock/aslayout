package se.gointeractive.layout.container
{
  import flash.utils.Dictionary;
  
  import se.gointeractive.layout.Layoutable;
  import se.gointeractive.layout.LayoutableElement;
  import se.gointeractive.layout.Position;
  
  public class Container implements Layoutable
  {
    private const elementContainer : Dictionary = new Dictionary;
    
    public function add
      (logicalElement : LayoutableElement,
       physicalElement : Positionable) : void
    { elementContainer[logicalElement] = physicalElement; }
    
    public function moveElement
      (element : LayoutableElement, position : Position) : void
    { Positionable(elementContainer[element]).position = position; }
  }
}

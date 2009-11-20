package se.gointeractive.layout
{
  import se.gointeractive.layout.geometry.Position;
  
  public interface LayoutPositioner
  {
    function moveElement
      (element : LayoutElement,
       position : Position) : void;
  }
}

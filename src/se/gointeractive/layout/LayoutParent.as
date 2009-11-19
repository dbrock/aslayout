package se.gointeractive.layout
{
  import org.asspec.util.sequences.Sequence;
  
  public interface LayoutParent
  {
    function moveElement
      (element : LayoutElement,
       position : Position) : void;
  }
}

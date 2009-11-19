package se.gointeractive.layout
{
  import org.asspec.util.sequences.Sequence;
  
  public interface Layoutable
  {
    function moveElement
      (element : LayoutableElement, position : Position) : void;
  }
}

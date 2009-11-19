package se.gointeractive.layout
{
  import org.asspec.util.sequences.Sequence;
  
  public interface Layoutable
  {
    function get dimensions() : Dimensions;
    function get elements() : Sequence;
    
    function moveElement
      (element : LayoutableElement, position : Position) : void;
  }
}

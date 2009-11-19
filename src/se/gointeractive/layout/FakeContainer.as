package se.gointeractive.layout
{
  import org.asspec.util.sequences.ArraySequenceContainer;
  import org.asspec.util.sequences.Sequence;
  import org.asspec.util.sequences.SequenceContainer;

  public class FakeContainer implements Layoutable
  {
    private var _dimensions : Dimensions;
    
    internal const elementContainer : SequenceContainer
      = new ArraySequenceContainer;
    
    public function FakeContainer(dimensions : Dimensions)
    { _dimensions = dimensions; }

    public function get dimensions() : Dimensions
    { return _dimensions; }
    
    public function get elements() : Sequence
    { return elementContainer.sequence;  }
    
    public function moveElement
      (element : LayoutableElement, position : Position) : void
    { FakeElement(element).position = position; }
  }
}

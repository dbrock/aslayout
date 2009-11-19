package se.gointeractive.layout
{
  import org.asspec.util.sequences.ArraySequenceContainer;
  import org.asspec.util.sequences.Sequence;
  import org.asspec.util.sequences.SequenceContainer;

  public class FakeParent implements Layoutable
  {
    public function moveElement
      (element : LayoutableElement, position : Position) : void
    { FakeElement(element).position = position; }
  }
}

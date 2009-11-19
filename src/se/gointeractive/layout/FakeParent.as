package se.gointeractive.layout
{
  import org.asspec.util.sequences.ArraySequenceContainer;
  import org.asspec.util.sequences.Sequence;
  import org.asspec.util.sequences.SequenceContainer;

  public class FakeParent implements LayoutParent
  {
    public function moveElement
      (element : LayoutElement, position : Position) : void
    { FakeElement(element).position = position; }
  }
}

package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;
  
  internal class Shaper
  {
    private var alignment : Alignment;
    private var dimensioner : Dimensioner;
    private var secondarySize : Number;
    
    public function Shaper
      (alignment : Alignment,
       dimensioner : Dimensioner,
       secondarySize : Number)
    {
      this.alignment = alignment;
      this.dimensioner = dimensioner;
      this.secondarySize = secondarySize;
    }

    public function shapeElements(elements : Sequence) : void
    { elements.forEach(shapeElement); }

    private function shapeElement(element : LayoutElement) : void
    { element.allocatedDimensions = getDimensions(element); }
    
    private function getDimensions
      (element : LayoutElement) : Dimensions
    {
      return alignment.getDimensions
        (dimensioner.getPrimarySize(element),
         dimensioner.getSecondarySize(element));
    }
  }
}

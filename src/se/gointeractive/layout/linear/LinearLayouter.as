package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.FlexibleLayoutElement;
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.geometry.Position;
  
  public class LinearLayouter
  {
    private var positioner : LayoutPositioner;
    private var dimensions : Dimensions;
    private var elements : Sequence;
    
    private var allocatedSpace : Number = 0;

    public function LinearLayouter
      (parent : LayoutPositioner,
       dimensions : Dimensions,
       elements : Sequence)
    {
      this.positioner = parent;
      this.dimensions = dimensions;
      this.elements = elements;
      
      elements.ensureType(LayoutElement);
    }
    
    public function execute() : void
    {
      resizeFlexibleElements();
      repositionElements();
    }
    
    private function resizeFlexibleElements() : void
    { flexibleElements.forEach(resizeElement); }
    
    private function get flexibleElements() : Sequence
    { return elements.filter(isFlexible); }
    
    private function isFlexible(element : LayoutElement) : Boolean
    { return element is FlexibleLayoutElement; }
    
    private function repositionElements() : void
    { elements.forEach(packElement); }
    
    // ----------------------------------------------------
    
    private function resizeElement(element : FlexibleLayoutElement) : void
    { element.allocatedDimensions = getDimensions(element); }
    
    private function getDimensions
      (element : FlexibleLayoutElement) : Dimensions
    { return alignment.getDimensions(getSize(element), totalSecondarySpace); }
    
    private function getSize(element : LayoutElement) : Number
    { return plan.getPrimarySize(element); }
    
    // ----------------------------------------------------
    
    private function packElement(element : LayoutElement) : void
    {
      positioner.moveElement(element, currentPosition);
      allocatedSpace += getSize(element);
    }
    
    private function get currentPosition() : Position
    { return alignment.getDimensions(allocatedSpace, 0).asPosition; }
      
    // ----------------------------------------------------
    
    private function get totalPrimarySpace() : Number
    { return alignment.getPrimaryDimension(dimensions); }
    
    private function get totalSecondarySpace() : Number
    { return alignment.getSecondaryDimension(dimensions); }
    
    private function get plan() : Dimensioner
    { return new Dimensioner(totalPrimarySpace, elements, alignment); }
    
    protected function get alignment() : Alignment
    { throw new Error; }
  }
}

package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.FlexibleLayoutElement;
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.geometry.Position;
  
  public class LinearLayouter implements Layouter
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
    { return picker.getDimensions(getSize(element), totalSecondarySpace); }
    
    private function getSize(element : LayoutElement) : Number
    { return plan.getPrimarySize(element); }
    
    // ----------------------------------------------------
    
    private function packElement(element : LayoutElement) : void
    {
      positioner.moveElement(element, currentPosition);
      allocatedSpace += getSize(element);
    }
    
    private function get currentPosition() : Position
    { return picker.getDimensions(allocatedSpace, 0).asPosition; }
      
    // ----------------------------------------------------
    
    private function get totalPrimarySpace() : Number
    { return picker.getPrimaryDimension(dimensions); }
    
    private function get totalSecondarySpace() : Number
    { return picker.getSecondaryDimension(dimensions); }
    
    private function get plan() : LinearDimensionsPlan
    { return new LinearDimensionsPlan(totalPrimarySpace, elements, picker); }
    
    protected function get picker() : DimensionPicker
    { throw new Error; }
  }
}

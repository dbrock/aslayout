package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.FlexibleLayoutElement;
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.geometry.Position;
  import se.gointeractive.layout.geometry.Rectangle;
  
  public class LinearLayouter implements Layouter
  {
    private var positioner : LayoutPositioner;
    private var dimensions : Dimensions;
    private var elements : Sequence;
    private var plan : LinearDimensionsPlan;
    
    private var allocatedSpace : Number;

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
      reset();
      elements.forEach(pack);
    }
    
    private function reset() : void
    {
      allocatedSpace = 0;
      plan = new LinearDimensionsPlan(totalSpace, elements, getDimensionPicker());
    }
    
    private function get totalSpace() : Number
    { return picker.getPrimaryDimension(dimensions); }
    
    private function pack(element : LayoutElement) : void
    {
      positioner.moveElement(element, currentPosition);
      
      allocatedSpace += plan.getSize(element);
      
      if (element is FlexibleLayoutElement)
        setFlexibleSize(FlexibleLayoutElement(element));
    }
    
    private function get secondarySize() : Number
    { return picker.getSecondaryDimension(dimensions); }
    
    private function get currentPosition() : Position
    { return picker.getDimensions(allocatedSpace, 0).asPosition; }
    
    private function setFlexibleSize(element : FlexibleLayoutElement) : void
    { element.allocatedDimensions = getFlexibleSize(element); }
    
    private function getFlexibleSize
      (element : FlexibleLayoutElement) : Dimensions
    { return picker.getDimensions(plan.getSize(element), totalSecondarySize); }
    
    private function get totalSecondarySize() : Number
    { return picker.getSecondaryDimension(dimensions); }
    
    private function get picker() : DimensionPicker
    { return getDimensionPicker(); }
    
    protected function getDimensionPicker() : DimensionPicker
    { throw new Error; }
  }
}

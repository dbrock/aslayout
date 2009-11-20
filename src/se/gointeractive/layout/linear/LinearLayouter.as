package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.FlexibleLayoutElement;
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.geometry.Position;
  
  internal class LinearLayouter
  {
    private var request : LayoutRequest;
    private var alignment : Alignment;
    
    private var allocatedSpace : Number = 0;

    public function LinearLayouter
      (request : LayoutRequest, alignment : Alignment)
    {
      this.request = request;
      this.alignment = alignment;
    }
    
    public function execute() : void
    {
      shapeElements();
      packElements();
    }
    
    private function shapeElements() : void
    { request.flexibleElements.forEach(shapeElement); }
    
    private function packElements() : void
    { request.elements.forEach(packElement); }
    
    // ----------------------------------------------------
    
    private function shapeElement(element : FlexibleLayoutElement) : void
    { element.allocatedDimensions = getDimensions(element); }
    
    private function getDimensions
      (element : FlexibleLayoutElement) : Dimensions
    { return alignment.getDimensions(getSize(element), totalSecondarySpace); }
    
    private function getSize(element : LayoutElement) : Number
    { return dimensioner.getPrimarySize(element); }
    
    // ----------------------------------------------------
    
    private function packElement(element : LayoutElement) : void
    {
      request.positioner.moveElement(element, currentPosition);
      allocatedSpace += getSize(element);
    }
    
    private function get currentPosition() : Position
    { return alignment.getPosition(allocatedSpace, 0); }
      
    // ----------------------------------------------------
    
    private function get totalPrimarySpace() : Number
    { return alignment.getPrimaryDimension(request.dimensions); }
    
    private function get totalSecondarySpace() : Number
    { return alignment.getSecondaryDimension(request.dimensions); }
    
    private function get dimensioner() : Dimensioner
    { return new Dimensioner(totalPrimarySpace, request.elements, alignment); }
  }
}

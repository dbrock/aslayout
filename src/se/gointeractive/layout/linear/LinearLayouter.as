package se.gointeractive.layout.linear
{
  import se.gointeractive.layout.FlexibleLayoutElement;
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;
  
  public class LinearLayouter
  {
    private var request : LayoutRequest;
    private var alignment : Alignment;
    
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
    
    // ----------------------------------------------------
    
    private function shapeElements() : void
    { shaper.shapeElements(request.flexibleElements); }
    
    private function get shaper() : Shaper
    { return new Shaper(alignment, dimensioner, totalSecondarySpace); }
    
    // ----------------------------------------------------
    
    private function packElements() : void
    { getPacker().execute(request.elements); }
    
    private function getPacker() : Packer
    { return new Packer(request.positioner, alignment, dimensioner); }
    
    // ----------------------------------------------------
    
    private function get dimensioner() : Dimensioner
    { return new Dimensioner(totalPrimarySpace, request.elements, alignment); }
    
    private function get totalPrimarySpace() : Number
    { return alignment.getPrimaryDimension(request.dimensions); }
    
    private function get totalSecondarySpace() : Number
    { return alignment.getSecondaryDimension(request.dimensions); }
    
    // ----------------------------------------------------
    
    public static function layoutHorizontally(request : LayoutRequest) : void
    { new LinearLayouter(request, new HorizontalAlignment).execute(); }
    
    public static function layoutVertically(request : LayoutRequest) : void
    { new LinearLayouter(request, new VerticalAlignment).execute(); }
  }
}

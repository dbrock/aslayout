package se.gointeractive.layout.flash
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.linear.LayoutRequest;
  import se.gointeractive.layout.linear.LinearLayouter;
  
  public class FlashLayouter
  {
    private var dimensions : Dimensions;
    
    public function FlashLayouter(dimensions : Dimensions)
    { this.dimensions = dimensions; }
    
    public function layoutHorizontally(elements : Sequence) : void
    { LinearLayouter.layoutHorizontally(getRequest(elements)); }

    public function layoutVertically(elements : Sequence) : void
    { LinearLayouter.layoutVertically(getRequest(elements)); }
    
    private function getRequest(elements : Sequence) : LayoutRequest
    {
      return new LayoutRequest
        (new FlashLayoutPositioner, dimensions, elements);
    }
  }
}

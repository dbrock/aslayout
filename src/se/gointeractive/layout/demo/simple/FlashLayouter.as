package se.gointeractive.layout.demo.simple
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.linear.ColumnLayouter;
  import se.gointeractive.layout.linear.RowLayouter;
  
  public class FlashLayouter
  {
    private var dimensions : Dimensions;
    
    public function FlashLayouter(dimensions : Dimensions)
    { this.dimensions = dimensions; }
    
    public function layoutHorizontally(elements : Sequence) : void
    { new RowLayouter(new FlashLayoutParent, dimensions, elements).execute(); }

    public function layoutVertically(elements : Sequence) : void
    { new ColumnLayouter(new FlashLayoutParent, dimensions, elements).execute(); }
  }
}

package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.geometry.Dimensions;
  
  public class RowLayouter extends LinearLayouter
  {
    public function RowLayouter(request : LayoutRequest)
    { super(request, new HorizontalAlignment); }
  }
}

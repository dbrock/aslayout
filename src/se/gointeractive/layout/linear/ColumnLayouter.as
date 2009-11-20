package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Dimensions;
  
  public class ColumnLayouter extends LinearLayouter
  {
    public function ColumnLayouter(request : LayoutRequest)
    { super(request, new VerticalAlignment); }
  }
}

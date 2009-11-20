package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.geometry.Position;
  import se.gointeractive.layout.geometry.Rectangle;
  
  public class ColumnLayouter extends LinearLayouter
  {
    public function ColumnLayouter
      (parent : LayoutPositioner, dimensions : Dimensions, elements : Sequence)
    { super(parent, dimensions, elements); }
    
    override protected function getDimensionPicker() : DimensionPicker
    { return new HeightPicker; }
  }
}

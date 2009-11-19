package se.gointeractive.layout
{
  import org.asspec.util.sequences.Sequence;
  
  public class ColumnLayouter extends LinearLayouter
  {
    public function ColumnLayouter
      (parent : LayoutParent, dimensions : Dimensions, elements : Sequence)
    { super(parent, dimensions, elements); }
    
    override protected function getRemainingSpace
      (dimensions : Dimensions) : Rectangle
    {
      const newDimensions : Dimensions = Dimensions.of
        (space.dimensions.width,
         space.dimensions.height - dimensions.height)
      const newPosition : Position = Position.of
        (space.position.x,
         space.position.y + dimensions.height);
      
      return newDimensions.rectangleAt(newPosition);
    }
  }
}

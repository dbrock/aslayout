package se.gointeractive.layout
{
  import org.asspec.util.sequences.Sequence;
  
  public class RowLayouter extends LinearLayouter
  {
    public function RowLayouter
      (parent : Layoutable, dimensions : Dimensions, elements : Sequence)
    { super(parent, dimensions, elements); }
    
    override protected function getRemainingSpace
      (dimensions : Dimensions) : Rectangle
    {
      const newDimensions : Dimensions = Dimensions.of
        (space.dimensions.width - dimensions.width,
         space.dimensions.height)
      const newPosition : Position = Position.of
        (space.position.x + dimensions.width,
         space.position.y);
      
      return newDimensions.rectangleAt(newPosition);
    }
  }
}

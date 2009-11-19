package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.LayoutParent;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.geometry.Position;
  import se.gointeractive.layout.geometry.Rectangle;
  
  public class RowLayouter extends LinearLayouter
  {
    public function RowLayouter
      (parent : LayoutParent, dimensions : Dimensions, elements : Sequence)
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

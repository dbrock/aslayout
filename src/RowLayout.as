package
{
  import org.asspec.util.sequences.ArraySequenceContainer;
  import org.asspec.util.sequences.SequenceContainer;
  
  public class RowLayout extends LinearLayout
  {
    public function RowLayout(dimensions : Dimensions)
    { super(dimensions); }
    
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

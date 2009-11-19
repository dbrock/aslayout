package
{
  public class ColumnLayout extends LinearLayout
  {
    public function ColumnLayout(dimensions : Dimensions)
    { super(dimensions); }
    
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

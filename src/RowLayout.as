package
{
  import org.asspec.util.sequences.ArraySequenceContainer;
  import org.asspec.util.sequences.SequenceContainer;
  
  public class RowLayout
  {
    private const elements : SequenceContainer = new ArraySequenceContainer;
    
    private var space : Rectangle;
    private var dimensions : Dimensions;

    public function RowLayout(dimensions : Dimensions)
    { this.dimensions = dimensions; }
    
    public function add(element : Layoutable) : void
    { elements.add(element); }
    
    public function execute() : void
    {
      reset();
      
      for each (var element : Layoutable in elements)
        pack(element);
    }
    
    private function reset() : void
    { space = dimensions.rectangleAt(Position.of(0, 0)); }
    
    private function pack(element : Layoutable) : void
    {
      if (fits(element))
        element.bounds = allocate(element.dimensions);
      else
        throw new Error;
    }
    
    private function fits(element : Layoutable) : Boolean
    { return element.dimensions.fitsInside(space.dimensions); }
    
    private function allocate(dimensions : Dimensions) : Rectangle
    {
      const result : Rectangle = dimensions.rectangleAt(space.position);
      
      const newDimensions : Dimensions = Dimensions.of
        (space.dimensions.width - dimensions.width,
         space.dimensions.height)
      const newPosition : Position = Position.of
        (space.position.x + dimensions.width,
         space.position.y);
      
      space = newDimensions.rectangleAt(newPosition);
      
      return result;
    }
  }
}

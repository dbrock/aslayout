package
{
  import org.asspec.util.sequences.ArraySequenceContainer;
  import org.asspec.util.sequences.SequenceContainer;
  
  public class LinearLayout
  {
    private const elements : SequenceContainer = new ArraySequenceContainer;
    private var dimensions : Dimensions;
    
    protected var space : Rectangle;

    public function LinearLayout(dimensions : Dimensions)
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
      
      space = getRemainingSpace(dimensions);
      
      return result;
    }
    
    protected function getRemainingSpace(dimensions : Dimensions) : Rectangle
    { throw new Error; }
  }
}

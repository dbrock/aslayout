package
{
  import org.asspec.util.sequences.Sequence;
  
  public class LinearLayouter implements Layouter
  {
    private var container : Layoutable;
    
    protected var space : Rectangle;

    public function LinearLayouter(container : Layoutable)
    { this.container = container; }
    
    private function get elements() : Sequence
    { return container.elements; }
    
    private function get dimensions() : Dimensions
    { return container.dimensions; }
    
    public function execute() : void
    {
      reset();
      
      for each (var element : LayoutableElement in elements)
        pack(element);
    }
    
    private function reset() : void
    { space = dimensions.rectangleAt(Position.of(0, 0)); }
    
    private function pack(element : LayoutableElement) : void
    {
      if (fits(element))
        container.moveElement(element, allocate(element.dimensions).position);
      else
        throw new Error;
    }
    
    private function fits(element : LayoutableElement) : Boolean
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

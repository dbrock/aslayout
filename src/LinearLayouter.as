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
      elements.forEach(tryPacking);
    }
    
    private function reset() : void
    { space = dimensions.asRectangle; }
    
    private function tryPacking(element : LayoutableElement) : void
    {
      if (elementFits(element))
        pack(element);
      else
        throw new Error;
    }
    
    private function elementFits(element : LayoutableElement) : Boolean
    { return element.preferredDimensions.fitsInside(space.dimensions); }
    
    private function pack(element : LayoutableElement) : void
    {
      const position : Position = space.position;
      
      allocate(element.preferredDimensions);
      
      container.moveElement(element, position);
    }
    
    private function allocate(dimensions : Dimensions) : void
    { space = getRemainingSpace(dimensions); }
    
    protected function getRemainingSpace(dimensions : Dimensions) : Rectangle
    { throw new Error; }
  }
}

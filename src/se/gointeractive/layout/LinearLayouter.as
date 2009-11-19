package se.gointeractive.layout
{
  import org.asspec.util.sequences.Sequence;
  
  public class LinearLayouter implements Layouter
  {
    private var parent : LayoutParent;
    private var dimensions : Dimensions;
    private var elements : Sequence;
    
    protected var space : Rectangle;

    public function LinearLayouter
      (parent : LayoutParent,
       dimensions : Dimensions,
       elements : Sequence)
    {
      this.parent = parent;
      this.dimensions = dimensions;
      this.elements = elements;
    }
    
    public function execute() : void
    {
      reset();
      elements.forEach(tryPacking);
    }
    
    private function reset() : void
    { space = dimensions.asRectangle; }
    
    private function tryPacking(element : LayoutElement) : void
    {
      if (elementFits(element))
        pack(element);
      else
        throw new Error;
    }
    
    private function elementFits(element : LayoutElement) : Boolean
    { return element.preferredDimensions.fitsInside(space.dimensions); }
    
    private function pack(element : LayoutElement) : void
    {
      const position : Position = space.position;
      
      allocate(element.preferredDimensions);
      
      parent.moveElement(element, position);
    }
    
    private function allocate(dimensions : Dimensions) : void
    { space = getRemainingSpace(dimensions); }
    
    protected function getRemainingSpace(dimensions : Dimensions) : Rectangle
    { throw new Error; }
  }
}

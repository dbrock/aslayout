package se.gointeractive.layout.flash
{
  import flash.display.DisplayObject;
  
  import org.asspec.util.sequences.ArraySequenceContainer;
  import org.asspec.util.sequences.Sequence;
  import org.asspec.util.sequences.SequenceContainer;
  
  import se.gointeractive.layout.geometry.Dimensions;
  
  public class AbstractLayout
  {
    private const elementContainer : SequenceContainer
      = new ArraySequenceContainer;
      
    public var dimensions : Dimensions = null;
    
    public function addElement(element : DisplayObject) : void
    { elementContainer.add(element); }
    
    protected function get elements() : Sequence
    { return elementContainer.sequence; }
    
    protected function get layouter() : FlashLayouter
    { return new FlashLayouter(dimensions); }
    
    public function execute() : void
    { throw new Error; }
  }
}

package se.gointeractive.layout.demo.simple
{
  import flash.display.DisplayObject;
  import flash.display.Sprite;
  
  import org.asspec.util.sequences.ArraySequenceContainer;
  import org.asspec.util.sequences.SequenceContainer;
  
  import se.gointeractive.layout.geometry.Dimensions;

  public class LayoutableContainer extends Sprite 
  {
    private const elementContainer : SequenceContainer
      = new ArraySequenceContainer;
      
    public var dimensions : Dimensions = null;
    
    public function addElement(element : DisplayObject) : void
    { elementContainer.add(element); }
    
    public function layoutHorizontally() : void
    { layouter.layoutHorizontally(elementContainer.sequence); }
    
    public function layoutVertically() : void
    { layouter.layoutHorizontally(elementContainer.sequence); }
    
    private function get layouter() : FlashLayouter
    { return new FlashLayouter(dimensions); }
  }
}

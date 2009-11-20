package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Position;
  
  internal class Packer
  {
    private var positioner : LayoutPositioner;
    private var alignment : Alignment;
    private var dimensioner : Dimensioner;
    
    private var allocatedSpace : Number = 0;

    public function Packer
      (positioner : LayoutPositioner,
       alignment : Alignment,
       dimensioner : Dimensioner)
    {
      this.positioner = positioner;
      this.alignment = alignment;
      this.dimensioner = dimensioner;
    }
    
    public function execute(elements : Sequence) : void
    { elements.forEach(pack); }
    
    private function pack(element : LayoutElement) : void
    {
      positioner.moveElement(element, currentPosition);
      allocatedSpace += getSize(element);
    }
    
    private function get currentPosition() : Position
    { return alignment.getPosition(allocatedSpace, 0); }
    
    private function getSize(element : LayoutElement) : Number
    { return dimensioner.getPrimarySize(element); }
  }
}

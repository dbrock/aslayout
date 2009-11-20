package se.gointeractive.layout.linear.specification
{
  import org.asspec.specification.AbstractSpecification;
  import org.asspec.util.sequences.ArraySequenceContainer;
  import org.asspec.util.sequences.Sequence;
  import org.asspec.util.sequences.SequenceContainer;
  
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.linear.LayoutRequest;
  import se.gointeractive.layout.linear.LinearLayouter;

  internal class AbstractLayouterSpecification extends AbstractSpecification
  {
    private const elementContainer : SequenceContainer
      = new ArraySequenceContainer;
    
    protected function add_rigid_element
      (width : Number, height : Number) : FakeRigidElement
    {
      const element : FakeRigidElement
        = new FakeRigidElement(Dimensions.of(width, height));
      
      elementContainer.add(element);
      
      return element;
    }
    
    protected function add_flexible_element() : FakeFlexibleElement
    {
      const element : FakeFlexibleElement = new FakeFlexibleElement;
      
      elementContainer.add(element);
      
      return element;
    }
    
    protected function layout_horizontally
      (width : Number, height : Number) : void
    { LinearLayouter.layoutHorizontally(getRequest(width, height)); }
    
    protected function layout_vertically
      (width : Number, height : Number) : void
    { LinearLayouter.layoutVertically(getRequest(width, height)); }
    
    private function getRequest
      (width : Number, height : Number) : LayoutRequest
    {
      return new LayoutRequest
        (positioner, Dimensions.of(width, height), elements);
    }
    
    private function get positioner() : LayoutPositioner
    { return new FakePositioner; }
    
    private function get elements() : Sequence
    { return elementContainer.sequence; }
  }
}

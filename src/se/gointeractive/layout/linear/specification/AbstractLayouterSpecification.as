package se.gointeractive.layout.linear.specification
{
  import org.asspec.specification.AbstractSpecification;
  import org.asspec.util.sequences.ArraySequenceContainer;
  import org.asspec.util.sequences.Sequence;
  import org.asspec.util.sequences.SequenceContainer;
  
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.linear.LayoutRequest;

  internal class AbstractLayouterSpecification extends AbstractSpecification
  {
    private var parent : FakePositioner;
    
    private const elementContainer : SequenceContainer
      = new ArraySequenceContainer;
    
    protected function add_element
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
    
    protected function execute_layout(width : Number, height : Number) : void
    {
      const parent : LayoutPositioner = new FakePositioner;
      const dimensions : Dimensions = Dimensions.of(width, height);
      const elements : Sequence = elementContainer.sequence;
      
      layout(new LayoutRequest(parent, dimensions, elements));
    }
    
    protected function layout(request : LayoutRequest) : void
    { throw new Error; }
  }
}

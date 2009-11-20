package se.gointeractive.layout.linear
{
  import org.asspec.specification.AbstractSpecification;
  import org.asspec.util.sequences.ArraySequenceContainer;
  import org.asspec.util.sequences.Sequence;
  import org.asspec.util.sequences.SequenceContainer;
  
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Dimensions;

  public class AbstractLayouterSpecification extends AbstractSpecification
  {
    private var layouter : Layouter;
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
      
      getLayouter(parent, dimensions, elements).execute();
    }
    
    protected function getLayouter
      (parent : LayoutPositioner,
       dimensions : Dimensions,
       elements : Sequence) : Layouter
    { throw new Error; }
  }
}

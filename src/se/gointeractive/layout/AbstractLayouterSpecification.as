package se.gointeractive.layout
{
  import org.asspec.specification.AbstractSpecification;
  import org.asspec.util.sequences.ArraySequenceContainer;
  import org.asspec.util.sequences.Sequence;
  import org.asspec.util.sequences.SequenceContainer;
  
  import se.gointeractive.layout.geometry.Dimensions;

  public class AbstractLayouterSpecification extends AbstractSpecification
  {
    private var layouter : Layouter;
    private var parent : FakeParent;
    
    private const elementContainer : SequenceContainer
      = new ArraySequenceContainer;
    
    protected function use_layout(width : Number, height : Number) : void
    {
      parent;
    }
    
    protected function add_element
      (width : Number, height : Number) : FakeElement
    {
      const element : FakeElement
        = new FakeElement(Dimensions.of(width, height));
      
      elementContainer.add(element);
      
      return element;
    }
    
    protected function execute_layout(width : Number, height : Number) : void
    {
      const parent : LayoutParent = new FakeParent;
      const dimensions : Dimensions = Dimensions.of(width, height);
      const elements : Sequence = elementContainer.sequence;
      
      getLayouter(parent, dimensions, elements).execute();
    }
    
    protected function getLayouter
      (parent : LayoutParent,
       dimensions : Dimensions,
       elements : Sequence) : Layouter
    { throw new Error; }
    
  }
}

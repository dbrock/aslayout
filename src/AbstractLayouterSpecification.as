package
{
  import org.asspec.specification.AbstractSpecification;

  public class AbstractLayouterSpecification extends AbstractSpecification
  {
    private var layouter : Layouter;
    private var container : FakeContainer;
    
    protected function use_layout(width : Number, height : Number) : void
    {
      container = new FakeContainer(Dimensions.of(width, height));
      layouter = getLayouter(container);
    }
    
    protected function getLayouter(container : Layoutable) : Layouter
    { throw new Error; }
    
    protected function add_element
      (width : Number, height : Number) : FakeElement
    {
      const element : FakeElement
        = new FakeElement(Dimensions.of(width, height));
      
      container.elementContainer.add(element);
      
      return element;
    }
    
    protected function execute_layout() : void
    { layouter.execute(); }
  }
}

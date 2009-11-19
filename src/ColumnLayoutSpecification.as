package
{
  import org.asspec.specification.AbstractSpecification;

  public class ColumnLayoutSpecification extends AbstractSpecification
  {
    private var layout : ColumnLayout;
    
    override protected function execute() : void
    {
      it("should layout two elements correctly", function () : void {
        use_layout(200, 200);
        
        const element1 : FakeLayoutable = add_element(100, 100);
        const element2 : FakeLayoutable = add_element(100, 100);
        
        layout.execute();
                
        specify(element1.bounds).should.look_like("100x100@(0, 0)");
        specify(element2.bounds).should.look_like("100x100@(0, 100)");
      });
    }
    
    private function use_layout(width : Number, height : Number) : void
    { layout = new ColumnLayout(Dimensions.of(width, height)); }
    
    private function add_element
      (width : Number, height : Number) : FakeLayoutable
    {
      const element : FakeLayoutable
        = new FakeLayoutable(Dimensions.of(width, height));
      
      layout.add(element);
      
      return element;
    }
  }
}

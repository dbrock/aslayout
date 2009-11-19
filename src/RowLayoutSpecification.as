package
{
  import org.asspec.specification.AbstractSpecification;

  public class RowLayoutSpecification extends AbstractSpecification
  {
    private var layout : RowLayout;
    
    override protected function execute() : void
    {
      it("should work without elements", function () : void {
        specify(new RowLayout(Dimensions.of(0, 0)).execute)
          .should.not.throw_error;
      });
      
      it("should not layout elements prematurely", function () : void {
        use_layout(200, 200);
        
        const element : FakeLayoutable = add_element(100, 100);
        
        specify(element.bounds).should.equal(null);
      });
      
      it("should fail when one element does not fit", function () : void {
        use_layout(50, 50);
        add_element(100, 100);
        
        specify(layout.execute).should.throw_error;
      });
      
      it("should fail when two elements do not fit", function () : void {
        use_layout(100, 100);
        add_element(80, 80);
        add_element(80, 80);
        
        specify(layout.execute).should.throw_error;
      });
      
      it("should layout one element correctly", function () : void {
        use_layout(200, 200);
        
        const element : FakeLayoutable = add_element(100, 100);
        
        layout.execute();
                
        specify(element.bounds).should.look_like("100x100@(0, 0)");
      });
      
      it("should be reusable", function () : void {
        use_layout(200, 200);
        
        const element : FakeLayoutable = add_element(100, 100);
        
        layout.execute();
        layout.execute();
                
        specify(element.bounds).should.look_like("100x100@(0, 0)");
      });
      
      it("should layout two elements correctly", function () : void {
        use_layout(200, 200);
        
        const element1 : FakeLayoutable = add_element(100, 100);
        const element2 : FakeLayoutable = add_element(100, 100);
        
        layout.execute();
                
        specify(element1.bounds).should.look_like("100x100@(0, 0)");
        specify(element2.bounds).should.look_like("100x100@(100, 0)");
      });
    }
    
    private function use_layout(width : Number, height : Number) : void
    { layout = new RowLayout(Dimensions.of(width, height)); }
    
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

package
{
  import org.asspec.specification.AbstractSpecification;

  public class RowLayouterSpecification extends AbstractLayouterSpecification
  {
    override protected function execute() : void
    {
      it("should work without elements", function () : void {
        use_layout(0, 0);
        specify(execute_layout).should.not.throw_error;
      });
      
      it("should fail when one element does not fit", function () : void {
        use_layout(50, 50);
        add_element(100, 100);
        specify(execute_layout).should.throw_error;
      });
      
      it("should fail when two elements do not fit", function () : void {
        use_layout(100, 100);
        add_element(80, 80);
        add_element(80, 80);
        specify(execute_layout).should.throw_error;
      });
      
      it("should layout one element correctly", function () : void {
        use_layout(200, 200);
        
        const element : FakeElement = add_element(100, 100);
        
        execute_layout();
                
        specify(element.position).should.look_like("(0, 0)");
      });
      
      it("should be reusable", function () : void {
        use_layout(200, 200);
        
        const element : FakeElement = add_element(100, 100);
        
        execute_layout();
        execute_layout();
                
        specify(element.position).should.look_like("(0, 0)");
      });
      
      it("should layout two elements correctly", function () : void {
        use_layout(200, 200);
        
        const element1 : FakeElement = add_element(100, 100);
        const element2 : FakeElement = add_element(100, 100);
        
        execute_layout();
                
        specify(element1.position).should.look_like("(0, 0)");
        specify(element2.position).should.look_like("(100, 0)");
      });
    }
    
    override protected function getLayouter(container : Layoutable) : Layouter
    { return new RowLayouter(container); }
  }
}

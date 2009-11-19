package
{
  import org.asspec.specification.AbstractSpecification;

  public class ColumnLayouterSpecification
    extends AbstractLayouterSpecification
  {
    override protected function execute() : void
    {
      it("should layout two elements correctly", function () : void {
        use_layout(200, 200);
        
        const element1 : FakeElement = add_element(100, 100);
        const element2 : FakeElement = add_element(100, 100);
        
        execute_layout();
        
        specify(element1.position).should.look_like("(0, 0)");
        specify(element2.position).should.look_like("(0, 100)");
      });
    }
    
    override protected function getLayouter(container : Layoutable) : Layouter
    { return new ColumnLayouter(container); }
  }
}

package se.gointeractive.layout.linear.specification
{
  import se.gointeractive.layout.linear.LayoutRequest;
  import se.gointeractive.layout.linear.LinearLayouter;

  internal class ColumnLayouterSpecification
    extends AbstractLayouterSpecification
  {
    override protected function execute() : void
    {
      it("should layout two elements correctly", function () : void {
        const element1 : FakeRigidElement = add_element(100, 100);
        const element2 : FakeRigidElement = add_element(100, 100);
        
        execute_layout(200, 200);
        
        specify(element1.position).should.look_like("(0, 0)");
        specify(element2.position).should.look_like("(0, 100)");
      });
    }
    
    override protected function layout(request : LayoutRequest) : void
    { LinearLayouter.layoutVertically(request); }
  }
}

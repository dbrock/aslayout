package se.gointeractive.layout.linear.specification
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.linear.Layouter;
  import se.gointeractive.layout.linear.RowLayouter;

  internal class RowLayouterSpecification
    extends AbstractLayouterSpecification
  {
    override protected function execute() : void
    {
      it("should work without elements", function () : void {
        specify(function () : void {
          execute_layout(0, 0); })
            .should.not.throw_error;
      });
      
      it("should fail when one element does not fit", function () : void {
        add_element(100, 100);
        
        specify(function () : void {
          execute_layout(50, 50); })
            .should.throw_error;
      });
      
      it("should fail when two elements do not fit", function () : void {
        add_element(80, 80);
        add_element(80, 80);
        
        specify(function () : void {
          execute_layout(100, 100); })
            .should.throw_error;
      });
      
      it("should layout one element correctly", function () : void {
        const element : FakeRigidElement = add_element(100, 100);
        
        execute_layout(200, 200);
        
        specify(element.position).should.look_like("(0, 0)");
      });
      
      it("should be reusable", function () : void {
        const element : FakeRigidElement = add_element(100, 100);
        
        execute_layout(200, 200);
        execute_layout(200, 200);
                
        specify(element.position).should.look_like("(0, 0)");
      });
      
      it("should layout two elements correctly", function () : void {
        const element1 : FakeRigidElement = add_element(100, 100);
        const element2 : FakeRigidElement = add_element(100, 100);
        
        execute_layout(200, 200);
        
        specify(element1.position).should.look_like("(0, 0)");
        specify(element2.position).should.look_like("(100, 0)");
      });
      
      it("should layout single flexible element correctly", function () : void {
        const element : FakeFlexibleElement = add_flexible_element();
        
        execute_layout(200, 200);
        
        specify(element.position).should.look_like("(0, 0)");
        specify(element.allocatedDimensions).should.look_like("200x200");
      });
    }
    
    override protected function getLayouter
      (container : LayoutPositioner,
       dimensions : Dimensions,
       elements : Sequence) : Layouter
    { return new RowLayouter(container, dimensions, elements); }
  }
}

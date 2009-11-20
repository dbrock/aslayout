package se.gointeractive.layout.linear.specification
{
  import se.gointeractive.layout.linear.LayoutRequest;
  import se.gointeractive.layout.linear.LinearLayouter;

  public class LinearLayouterSpecification
    extends AbstractLayouterSpecification
  {
    override protected function execute() : void
    {
      it("should work without elements", function () : void {
        specify(function () : void {
          layout_horizontally(0, 0); })
            .should.not.throw_error;
      });
      
      it("should fail when one element does not fit", function () : void {
        add_element(100, 100);
        
        specify(function () : void {
          layout_horizontally(50, 50); })
            .should.throw_error;
      });
      
      it("should fail when two elements do not fit", function () : void {
        add_element(80, 80);
        add_element(80, 80);
        
        specify(function () : void {
          layout_horizontally(100, 100); })
            .should.throw_error;
      });
      
      it("should layout one element correctly", function () : void {
        const element : FakeRigidElement = add_element(100, 100);
        
        layout_horizontally(200, 200);
        
        specify(element.position).should.look_like("(0, 0)");
      });
      
      it("should correctly layout two elements horizontally", function () : void {
        const element1 : FakeRigidElement = add_element(100, 100);
        const element2 : FakeRigidElement = add_element(100, 100);
        
        layout_horizontally(200, 200);
        
        specify(element1.position).should.look_like("(0, 0)");
        specify(element2.position).should.look_like("(100, 0)");
      });
      
      it("should correctly layout two elements vertically", function () : void {
        const element1 : FakeRigidElement = add_element(100, 100);
        const element2 : FakeRigidElement = add_element(100, 100);
        
        layout_vertically(200, 200);
        
        specify(element1.position).should.look_like("(0, 0)");
        specify(element2.position).should.look_like("(0, 100)");
      });
      
      it("should layout single flexible element correctly", function () : void {
        const element : FakeFlexibleElement = add_flexible_element();
        
        layout_horizontally(200, 200);
        
        specify(element.position).should.look_like("(0, 0)");
        specify(element.allocatedDimensions).should.look_like("200x200");
      });
      
      it("should layout two flexible elements correctly", function () : void {
        const element1 : FakeFlexibleElement = add_flexible_element();
        const element2 : FakeFlexibleElement = add_flexible_element();
        
        layout_horizontally(200, 200);
        
        specify(element1.position).should.look_like("(0, 0)");
        specify(element2.position).should.look_like("(100, 0)");
        specify(element1.allocatedDimensions).should.look_like("100x200");
        specify(element2.allocatedDimensions).should.look_like("100x200");
      });
    }
  }
}

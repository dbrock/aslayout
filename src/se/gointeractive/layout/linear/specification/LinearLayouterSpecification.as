package se.gointeractive.layout.linear.specification
{
  import org.asspec.specification.AbstractSpecification;
  import org.asspec.util.sequences.ArraySequenceContainer;
  import org.asspec.util.sequences.Sequence;
  import org.asspec.util.sequences.SequenceContainer;
  
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.linear.LayoutRequest;
  import se.gointeractive.layout.linear.LinearLayouter;

  public class LinearLayouterSpecification extends AbstractSpecification
  {
    override protected function execute() : void
    {
      it("should work without elements", function () : void {
        specify(function () : void {
          layout_horizontally(0, 0); })
            .should.not.throw_error;
      });
      
      it("should fail when one element does not fit", function () : void {
        add_rigid_element(100, 100);
        
        specify(function () : void {
          layout_horizontally(50, 50); })
            .should.throw_error;
      });
      
      it("should fail when two elements do not fit", function () : void {
        add_rigid_element(80, 80);
        add_rigid_element(80, 80);
        
        specify(function () : void {
          layout_horizontally(100, 100); })
            .should.throw_error;
      });
      
      it("should layout one element correctly", function () : void {
        const element : FakeRigidElement = add_rigid_element(100, 100);
        
        layout_horizontally(200, 200);
        
        specify(element.position).should.look_like("(0, 0)");
      });
      
      it("should correctly layout two elements horizontally", function () : void {
        const element1 : FakeRigidElement = add_rigid_element(100, 100);
        const element2 : FakeRigidElement = add_rigid_element(100, 100);
        
        layout_horizontally(200, 200);
        
        specify(element1.position).should.look_like("(0, 0)");
        specify(element2.position).should.look_like("(100, 0)");
      });
      
      it("should correctly layout two elements vertically", function () : void {
        const element1 : FakeRigidElement = add_rigid_element(100, 100);
        const element2 : FakeRigidElement = add_rigid_element(100, 100);
        
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
      
      it("should layout mixed elements correctly", function () : void {
        const element1 : FakeRigidElement = add_rigid_element(20, 20);
        const element2 : FakeFlexibleElement = add_flexible_element();
        const element3 : FakeRigidElement = add_rigid_element(40, 40);
        
        layout_horizontally(200, 200);
        
        specify(element1.position).should.look_like("(0, 0)");
        specify(element2.position).should.look_like("(20, 0)");
        specify(element3.position).should.look_like("(160, 0)");
        specify(element2.allocatedDimensions).should.look_like("140x200");
      });
    }
    
    private const elementContainer : SequenceContainer
      = new ArraySequenceContainer;
    
    protected function add_rigid_element
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
    
    protected function layout_horizontally
      (width : Number, height : Number) : void
    { LinearLayouter.layoutHorizontally(getRequest(width, height)); }
    
    protected function layout_vertically
      (width : Number, height : Number) : void
    { LinearLayouter.layoutVertically(getRequest(width, height)); }
    
    private function getRequest
      (width : Number, height : Number) : LayoutRequest
    {
      return new LayoutRequest
        (positioner, Dimensions.of(width, height), elements);
    }
    
    private function get positioner() : LayoutPositioner
    { return new FakePositioner; }
    
    private function get elements() : Sequence
    { return elementContainer.sequence; }
  }
}
